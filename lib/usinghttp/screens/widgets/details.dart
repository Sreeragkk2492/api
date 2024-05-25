import 'package:api/usinghttp/model/product.dart';
import 'package:flutter/material.dart';

class Detailspage extends StatelessWidget {
  Product product;
  Detailspage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(product.image!))),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              product.description!,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Wrap(children: [
            Text(
              '${product.rating?.rate!}',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
         
          ])
        ],
      ),
    ));
  }
}
