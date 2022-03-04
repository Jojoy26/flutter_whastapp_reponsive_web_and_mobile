// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_watsapp_clone/widgets/contact_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactsListWeb extends StatefulWidget {
  const ContactsListWeb({ Key? key }) : super(key: key);

  @override
  State<ContactsListWeb> createState() => _ContactsListWebState();
}

class _ContactsListWebState extends State<ContactsListWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFf6f6f6),
        foregroundColor: Colors.grey[600],
        title: CircleAvatar(),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.circle_outlined)
          ),
          SizedBox(width: 4,),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.message)
          ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.more_vert)
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 0.25,
                  color: Colors.grey
                )
              )
            ),
            padding: EdgeInsets.all(12),
            child: Theme(
              data: ThemeData().copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                  primary: Colors.grey[600],
                ),
              ), 
              child: Container(
                height: 35,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: Color(0xFFF0F2F5),
                    filled: true,
                    hintText: "Pesquisar ou começar um nova conversa",
                    hintStyle: TextStyle(fontSize: 15),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600], size: 20,),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              ),
            )
          ),
          Expanded(child: ContactList(isMobile: false,))
        ],
      ),
    );
  }
}