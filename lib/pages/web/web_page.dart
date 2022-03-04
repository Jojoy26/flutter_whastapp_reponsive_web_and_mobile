import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_watsapp_clone/pages/mobile/contact_mobile_page.dart';
import 'package:flutter_watsapp_clone/pages/web/contact_web.dart';
import 'package:flutter_watsapp_clone/pages/web/contacts_list_web.dart';
import 'package:flutter_watsapp_clone/utils/contact_list.dart';
import 'package:flutter_watsapp_clone/widgets/contact_list.dart';

class WebPage extends StatefulWidget {
  const WebPage({ Key? key }) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFeae6df),
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 15 / 100,
              color: Color(0xFF00a884),
            ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 9,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]
              ),
              margin: width > 1400 ? EdgeInsets.all(20) : EdgeInsets.all(0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: width > 1400 ? min(width * 30 / 100 - 20, 417) : min(width * 30 / 100 , 417)),
                    child: ContactsListWeb()
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: width > 1400 ? min(width * 70 / 100 - 20, 977) : min(width * 70 / 100 , 977)),
                    child: ContactWeb()
                  )
                ],
              )
            ),
          ),
        ],
      )
    );
  }
}

