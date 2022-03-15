import 'package:http/http.dart' as http;
import 'package:kanzalloshop/Model/products_model.dart';
import 'package:kanzalloshop/utils/my_string.dart';

class ProductServices {
  static Future<List<ProductsModel>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products.json'));
    if(response.statusCode == 200){
      var jsonData = response.body;
      // var data = List<Map<String, ProductsModel>>.from(jsonDecode(response.body));
      return productsModelFromJson(jsonData);
    }
    else{
      return throw Exception("Failed to load products");
    }
  }
}
