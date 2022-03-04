// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import 'package:flutter_watsapp_clone/utils/contact_list.dart';
import 'package:flutter_watsapp_clone/widgets/contact.dart';

class ContactList extends StatefulWidget {

  final bool isMobile;
  const ContactList({
    Key? key,
    required this.isMobile,
  }) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: contactModelList.length,
        itemBuilder: (context, index){
          return Contact(index: index, isMobile: widget.isMobile,);
        }
      ),
    );
  }
}