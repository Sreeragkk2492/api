import 'package:api/usingdio/model/datamodel.dart';
import 'package:api/usingdio/services/dioservice.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Datacontroller extends GetxController {
  RxList<Datamodel> data = RxList();
  RxBool isLoading = true.obs;
  RxBool isListDown = false.obs;
  RxBool isNetConnected = true.obs;

// controller of scrollable positioned list 
  var scrollcontroller = ItemScrollController();

  // to check the internet connection

  void isinternetconnected() async {
    isNetConnected.value = await InternetConnectionChecker().hasConnection;
  }
  //to fetch the data from api

  fetchdata() async {
    isinternetconnected();
    isLoading.value = true;
    var response = await Dioservice().getdata();
    if (response.statusCode == 200) {
      response.data.forEach((datas) {
        data.add(Datamodel.fromJson(datas));
      });
    isLoading.value=false; 
    }
  }

  // function to scroll down
  scrolltodown() {
    scrollcontroller.scrollTo(
        index: data.length,
        duration: const Duration(seconds: 1),
        curve: Curves.bounceInOut);
        isListDown.value=true;
  }
  // function to scroll up
   scrolltoup() {
    scrollcontroller.scrollTo(
        index: 0,
        duration: const Duration(seconds: 1),
        curve: Curves.bounceInOut);
        isListDown.value=false;
  } 

  @override
  void onInit() {
    fetchdata();
    isinternetconnected();
    super.onInit();
  }

}
