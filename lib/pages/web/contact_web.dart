import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_watsapp_clone/controllers/singleton_controller.dart';
import 'package:flutter_watsapp_clone/utils/contact_list.dart';
import 'package:flutter_watsapp_clone/widgets/messages_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({ Key? key }) : super(key: key);

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {

  Singleton controller = Get.put(Singleton());

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf6f6f6),
        elevation: 0,
        title: Row(
          children: [
            Obx(() => CircleAvatar(
                backgroundImage: NetworkImage(contactModelList[controller.selectedContactModel.value].avatar),
              )
            ),
            SizedBox(width: 10,),
            Obx(() => Text(contactModelList[controller.selectedContactModel.value].name, style: TextStyle(color: Colors.grey[800], fontSize: 16, fontWeight: FontWeight.w300),),)
          ],
        ),
        actions: [
          Icon(Icons.search, color: Colors.grey[700]),
          SizedBox(width: 15,),
          Icon(Icons.more_vert, color: Colors.grey[700]),
          SizedBox(width: 15,),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 1,
              color: Colors.white.withOpacity(0.35)
            )
          ),
          image: DecorationImage(
            image: AssetImage("lib/images/whatsapp_background2.jpg",),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.65), BlendMode.dstATop)
          )
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: max(width * 5 / 100, 10,), right: max(width * 5 / 100, 10)),
                  child: Obx(() => MessagesList(model: contactModelList[controller.selectedContactModel.value],
                ))
              )
            ),
            Container(
              color: Color(0xFFF0F2F5),
              padding: const EdgeInsets.all(14.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.tag_faces_sharp, color: Colors.grey[600], size: 29,)
                  ),
                  SizedBox(width: 5,),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: IconButton(
                      onPressed: (){}, 
                      icon: FaIcon(FontAwesomeIcons.paperclip, color: Colors.grey[600], size: 22,)
                    ),
                  ),
                  SizedBox(width: 7,),
                  Expanded(
                    child: Container(
                      height: 42,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none
                          ),
                          hintText: "Mensagem"
                        ),
                      ),
                    )
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 15, right: 20),
                    onPressed: (){},
                    icon: Icon(Icons.mic, color: Colors.grey[700], size: 30,)
                  )
                ],
              ),
            )
          ],
        ),
      ) 
    );
  }
}