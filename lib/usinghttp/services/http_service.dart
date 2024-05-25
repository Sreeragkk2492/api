import 'package:api/usinghttp/model/product.dart';
import 'package:http/http.dart' as http;

class HttpService{


static  Future <List<Product>> fetchproduct() async{
    //read all the product from api
    /// where base url=https://fakestoreapi.com
    /// and end points is=/product
    var response= await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if(response.statusCode==200){
      var data=response.body;
      return productFromJson(data);
    }else{
      throw Exception();
    }
  }

}