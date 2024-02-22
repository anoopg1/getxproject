import 'dart:convert';
import 'package:getx_project/productmodel/product.dart';
import 'package:getx_project/productmodel/productmodel.dart';
import 'package:http/http.dart' as http;


class ApiServices {
  Future<List<Product>?> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );

    final convertedData = jsonDecode(response.body);
    var s=Productmodel.fromJson(convertedData);
    var list=s.products;

  

    return list;
  }
}
