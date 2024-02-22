import 'package:get/get.dart';
import 'package:getx_project/api.dart';
import 'package:getx_project/productmodel/product.dart';

import 'package:getx_project/productmodel/productmodel.dart';

class MyController extends GetxController {
   RxList<Product> products=<Product>[].obs;
  void getProductList() async {
    // API Calling...
    final fetchedProducts = await ApiServices().fetchProducts()as Iterable<Product> ;
   products!.addAll(fetchedProducts);
    update();
  }
}
