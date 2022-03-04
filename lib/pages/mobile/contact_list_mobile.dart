// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_watsapp_clone/widgets/contact_list.dart';

class ContactListMobile extends StatefulWidget {
  const ContactListMobile({ Key? key }) : super(key: key);

  @override
  State<ContactListMobile> createState() => _ContactListMobileState();
}

class _ContactListMobileState extends State<ContactListMobile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF128C7E),
          title: Text("WhatsApp Clone"),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              makeText("conversas"),
              makeText("status"),
              makeText("chamadas")
            ]
          ),
        ),
        body: ContactList(isMobile: true,),
      ),
    );
  }
}

Widget makeText(String label){
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: Text(
      label.toUpperCase(), 
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),
    ),
  );
}