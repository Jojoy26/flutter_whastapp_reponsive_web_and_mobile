import 'package:flutter/material.dart';
import 'package:flutter_watsapp_clone/controllers/singleton_controller.dart';

import 'package:flutter_watsapp_clone/models/contact_model.dart';
import 'package:flutter_watsapp_clone/pages/mobile/contact_mobile_page.dart';
import 'package:flutter_watsapp_clone/utils/contact_list.dart';
import 'package:get/get.dart';

class Contact extends StatefulWidget {

  final int index;
  final bool isMobile;

  const Contact({
    Key? key,
    required this.isMobile, required this.index,
  }) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  Singleton controller = Get.find();

  void setModel(){
    controller.setContactModel(widget.index);
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
            onTap: (){
              setModel();
              if(MediaQuery.of(context).size.width > 900){
                return;
              } 
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => ContactMobilePage(index: widget.index,)
              ));
               
            },
            child: Obx(() => 
              Container(
              color: controller.selectedContactModel.value == widget.index ? Color(0xFFF0F2F5) : Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 13, bottom: 13, left: 10, right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(contactModelList[widget.index].avatar),
                            ),
                            SizedBox(width: 14,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(contactModelList[widget.index].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,),),
                                SizedBox(height: 3,),
                                Text(contactModelList[widget.index].messagesList[0].message, style: TextStyle(color: Colors.grey[600], fontSize: 14))
                              ],
                            ),
                          ],
                        ),
                        Text(contactModelList[widget.index].lastMessageDate, style: TextStyle(fontSize: 12, color: Colors.grey[700]))
                      ],
                    ),
                  ),
                  
                  Visibility(
                    visible: MediaQuery.of(context).size.width > 900,
                    child: Divider(
                      height: 0.1,
                      color: Colors.grey[200],
                    )
                  )
                ],
              ),
            ),
            )
          );
  }
}