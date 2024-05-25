import 'package:api/usinghttp/services/http_service.dart';
import 'package:get/get.dart';

class Productcontroller extends GetxController {
  RxBool isLoading = true.obs;
  var productlist = [].obs;


  @override

  void onInit() {
  readproducts();
    super.onInit();
  }


  void readproducts()async{
    try{
      isLoading(true);
      var products=await HttpService.fetchproduct();
      if(products!= null){
        productlist.value=products;
      }
    }catch(e){
      print(e);
    }finally{
      isLoading(false);
    }
  }
}
