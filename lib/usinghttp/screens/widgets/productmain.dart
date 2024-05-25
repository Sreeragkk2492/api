import 'package:api/usinghttp/controller/productcontroller.dart';
import 'package:api/usinghttp/screens/widgets/producttile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productmain extends StatelessWidget {
  Productmain({super.key});
  Productcontroller controller = Get.put(Productcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'Shop your favorites',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: Text('Loading'));
            } else {
              return GridView.builder(
                  itemCount: controller.productlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: .5,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) =>
                      Producttile(controller.productlist[index],));
            }
          }))
        ],
      ),
    );
  }
}
