import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/logic/Controller/products_controller.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        body: Obx(() {
          if (controller.favoriteList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/heart.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Please , Add your favorite products .",
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return buildFavoriteItems(
                    image: controller.favoriteList[index].image,
                    price: controller.favoriteList[index].price,
                    title: controller.favoriteList[index].title,
                    productId: controller.favoriteList[index].id
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  );
                },
                itemCount: controller.favoriteList.length);
          }
        }));
  }

  Widget buildFavoriteItems({
    required String image,
    required double price,
    required String title,
    required int productId
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  controller.manageFavorites(productId);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
