
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kanzalloshop/Model/products_model.dart';
import 'package:kanzalloshop/services/product_services.dart';

class ProductsController extends GetxController {
  var productList = <ProductsModel>[].obs;
  var favoriteList = <ProductsModel>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();
  // var isFavorites = false.obs;
  @override
  void onInit() {
    super.onInit();

    List? storedFavorites = storage.read<List>("isFavoritesList");
    if (storedFavorites != null) {
      favoriteList =
          storedFavorites.map((e) => ProductsModel.fromJson(e)).toList().obs;
    }
    getProducts();
  }

   getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavorites(int productId) async {
    var existIndex =
        favoriteList.indexWhere((element) => element.id == productId);
    await storage.remove("isFavoritesList");
    if (existIndex >= 0) {
      favoriteList.removeAt(existIndex);
    } else {
      favoriteList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavoritesList", favoriteList);
    }
  }

  bool isFavorites(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }
//Logic for favorite screen
//
// void addFavorites() {
//   isFavorites.value = !isFavorites.value;
// }
}
