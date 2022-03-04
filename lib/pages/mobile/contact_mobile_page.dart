

import 'package:flutter/material.dart';

import 'package:flutter_watsapp_clone/models/contact_model.dart';
import 'package:flutter_watsapp_clone/utils/contact_list.dart';
import 'package:flutter_watsapp_clone/widgets/messages_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactMobilePage extends StatefulWidget {
  final int index;
  const ContactMobilePage({
    Key? key, required this.index,
  }) : super(key: key);

  @override
  State<ContactMobilePage> createState() => _ContactMobilePageState();
}

class _ContactMobilePageState extends State<ContactMobilePage> {

  
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    Future popPage() async{
      if(Navigator.canPop(context)){
        await Future.delayed(Duration(seconds: 0));
        Navigator.pop(context);
        
      }
    }

    if(width > 900){
      popPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF128C7E),
        leadingWidth: 35,
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(contactModelList[widget.index].avatar),
            ),
            SizedBox(width: 10,),
            Text(contactModelList[widget.index].name),
          ],
        ),
        actions: [
          Icon(Icons.videocam_rounded, size: 27,),
          SizedBox(width: 20,),
          Icon(Icons.call, size: 22.5,),
          SizedBox(width: 18,),
          Icon(Icons.more_vert, size: 26,)
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/whatsapp_background2.jpg",),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.65), BlendMode.dstATop)
          )
        ),
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
        child: Column(
          children: [
            Expanded(
              child: MessagesList(model: contactModelList[widget.index],),
            ),
            Row(
              children: [
                Expanded(
                  child: Theme(
                    data: ThemeData().copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                        primary: Colors.grey,
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Mensagem",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide.none
                        ),
                        prefixIcon: Icon(Icons.tag_faces_sharp),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(FontAwesomeIcons.paperclip),
                            SizedBox(width: 15,),
                            Icon(Icons.monetization_on_rounded),
                            SizedBox(width: 15,),
                            Icon(Icons.camera_alt),
                            SizedBox(width: 10,)
                          ],
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF128C7E),
                    shape: BoxShape.circle
                  ),
                  child: IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.mic, color: Colors.white,)
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}