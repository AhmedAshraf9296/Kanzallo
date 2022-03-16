import 'package:get/get.dart';
import 'package:kanzalloshop/Model/products_model.dart';
import 'package:kanzalloshop/services/category_services.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategoryLoading = false.obs;
  var categoryList = <ProductsModel>[].obs;
  List<String> imageCategory = [
    "https://docme.sgp1.cdn.digitaloceanspaces.com/acetvm/2016/06/digital_electronics_2.jpg",
    "https://marvel-b1-cdn.bc0a.com/f00000000187246/ggl-api.g-trac.net/images/homelayout/20220112_121949NEW-Faberge-Desktop-Homepage-Files-Jan2022_80_80.jpg",
    "https://image.shutterstock.com/image-photo/mens-clothing-set-boots-watch-260nw-1427016581.jpg",
    "https://www.chartattack.com/wp-content/uploads/2020/01/Women-clothes-696x500.jpg"
  ];

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    var categoryName = await CategoryServices.getCategories();

    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategories(String nameCategory) async {
    isAllCategoryLoading(true);
    categoryList.value = await AllCategoryServices.getAllCategory(nameCategory);
    isAllCategoryLoading(false);
  }

  getCategoryIndex(int index) async {
    var categoryName = await getAllCategories(categoryNameList[index]);
    if (categoryName != null) {
      categoryList.value = categoryName;
    }
  }
}
