import 'package:flutter/material.dart';
import 'package:flutter_watsapp_clone/controllers/singleton_controller.dart';
import 'package:flutter_watsapp_clone/pages/mobile/contact_list_mobile.dart';
import 'package:flutter_watsapp_clone/pages/web/web_page.dart';
import 'package:get/get.dart';

class Responsive extends StatefulWidget {
  const Responsive({ Key? key }) : super(key: key);

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {

  Singleton controller = Get.put(Singleton());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      body: width > 900 ?
        WebPage()
          : 
        ContactListMobile(),
    );
  }
}