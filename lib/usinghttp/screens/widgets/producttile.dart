import 'package:api/usinghttp/model/product.dart';
import 'package:api/usinghttp/screens/widgets/details.dart';
import 'package:flutter/material.dart';

class Producttile extends StatelessWidget {
  final Product product;
 Producttile(this.product,);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Detailspage(product)));
      },
      child: Card(
         
        elevation: 10,
        child: Padding(padding: EdgeInsets.all(14),child: Column( 
          children: [
            Expanded(
              child: Container(
              //  height: 200,
                width: double.infinity,
                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(product.image!),fit: BoxFit.contain)),
              ),
            ),
            SizedBox(height: 10,),
            Text(product.title!,style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(product.price.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('${product.rating?.rate!}'),
          ],
        ),),
      ),
    );
  }
}