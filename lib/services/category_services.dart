import 'package:http/http.dart' as http;
import 'package:kanzalloshop/Model/category_model.dart';
import 'package:kanzalloshop/Model/products_model.dart';
import 'package:kanzalloshop/utils/my_string.dart';

class CategoryServices {
  static Future<List<String>> getCategories() async {
    var response = await http.get(Uri.parse('$baseUrl/categories.json'));
    if(response.statusCode == 200){
      var jsonData = response.body;
      // var data = List<Map<String, ProductsModel>>.from(jsonDecode(response.body));
      return categoryModelFromJson(jsonData);
    }
    else{
      return throw Exception("Failed to load categories");
    }
  }
}


class AllCategoryServices {
  static Future<List<ProductsModel>> getAllCategory(String categoryName) async {
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));
    if(response.statusCode == 200){
      var jsonData = response.body;
      // var data = List<Map<String, ProductsModel>>.from(jsonDecode(response.body));
      return productsModelFromJson(jsonData);
    }
    else{
      return throw Exception("Failed to load categories");
    }
  }
}