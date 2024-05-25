

import 'package:api/usingdio/controller/datacontroller.dart';
import 'package:api/usingdio/model/datamodel.dart';
import 'package:api/usingdio/screens/diodetails.dart';
import 'package:api/usingdio/utils/colors.dart';
import 'package:api/usingdio/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  runApp(GetMaterialApp(
    home: Diohome(),
    debugShowCheckedModeBanner: false,
  ));
}

class Diohome extends StatelessWidget {
  Datacontroller controller = Get.put(Datacontroller());

 final Datamodel model;
 Diohome(this.model);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dio home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Mycolors.primarycolor,
      ),
      backgroundColor: Mycolors.bgcolor,
      floatingActionButton:
          Obx(() => controller.isNetConnected.value ? buildfab() : Container()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: controller.isNetConnected.value
                  ? (controller.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : getdata(model))
                  : nointernet(context),
            )),
      ),
    );
  }

  FloatingActionButton buildfab() {
    return FloatingActionButton(
      onPressed: () {
        controller.isListDown.value
            ? controller.scrolltoup()
            : controller.scrolltodown();
      },
      child: Icon(controller.isListDown.value
          ? Icons.arrow_upward
          : Icons.arrow_downward),
    );
  }

  RefreshIndicator getdata(Datamodel model)  {
    
    return RefreshIndicator(
      
        child: ScrollablePositionedList.builder(
          itemScrollController: controller.scrollcontroller,
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Diodetails()));
                },
                child: Card(
                    child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo[900],
                    child: Text(controller.data[index].id.toString(),style: TextStyle(color: Colors.white),),
                  ),
                  title: Text(
                    controller.data[index].title!,
                  ),
                  subtitle: Text(controller.data[index].body!),
                )),
              );
            }),
        onRefresh: () {
          return controller.fetchdata();
        });
  }

 Center nointernet(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('no internet'),
        MaterialButton(onPressed: ()async{
          if(await InternetConnectionChecker().hasConnection){
            controller.fetchdata();
          }else{
            showcustomsnackbar(context);
          }
        
        })
      ],
    ),
  );
 }
}
