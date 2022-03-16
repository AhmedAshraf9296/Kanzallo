import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/Model/products_model.dart';
import 'package:kanzalloshop/View/screens/product_details_screen.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/cart_controller.dart';
import 'package:kanzalloshop/logic/Controller/category_controller.dart';
import 'package:kanzalloshop/logic/Controller/products_controller.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({
    Key? key,
   required this.categoryTitle,
  }) : super(key: key);
  final controller = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : mainColor,
        appBar: AppBar(
          title: Text(categoryTitle),
          centerTitle: true,
          backgroundColor: mainColor,
        ),
        body: Obx(() {
          if (categoryController.isAllCategoryLoading.value) {
            return Center(
                child: CircularProgressIndicator(
              color: Get.isDarkMode ? mainColor : greenColor,
            ));
          } else {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 200),
                itemCount: categoryController.categoryList.length,
                itemBuilder: (context, index) {
                  return buildCardItems(
                      image: categoryController.categoryList[index].image,
                      price: categoryController.categoryList[index].price,
                      rate: categoryController.categoryList[index].rating.rate,
                      productId: categoryController.categoryList[index].id,
                      productsModel: categoryController.categoryList[index],
                      onTap: () {
                        Get.to(
                          () => ProductDetailsScreen(
                            productsModel:
                                categoryController.categoryList[index],
                          ),
                        );
                      });
                });
          }
        }));
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductsModel productsModel,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                ),
              ]),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavorites(productId);
                      },
                      icon: controller.isFavorites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: mainColor,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: mainColor,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productsModel);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode ? Colors.black : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? greenColor : mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              "$rate",
                              13,
                              FontWeight.bold,
                              Get.isDarkMode ? Colors.black : Colors.white,
                              TextDecoration.none,
                            ),
                            Icon(
                              Icons.star,
                              size: 13,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
