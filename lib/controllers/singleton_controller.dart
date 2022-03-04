import 'package:flutter_watsapp_clone/models/contact_model.dart';
import 'package:flutter_watsapp_clone/utils/contact_list.dart';
import 'package:get/get.dart';

class Singleton extends GetxController {

  Rx<int> selectedContactModel = 0.obs;

  void setContactModel(int index,){
    selectedContactModel.value = index;
  }
}