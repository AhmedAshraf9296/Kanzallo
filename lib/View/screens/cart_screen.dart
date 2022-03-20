import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/cart/cart_total.dart';
import 'package:kanzalloshop/View/widgets/cart/empty_cart.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/cart_controller.dart';

import '../widgets/cart/cart_product.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? Colors.black : mainColor,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProductsInCart();
              },
              icon: const Icon(
                Icons.backspace,
              ),
            ),
          ],
        ),
        body: Obx(
          () {
            if (controller.productsMap.isEmpty) {
              return const EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProduct(
                            quantity:
                                controller.productsMap.values.toList()[index],
                            index: index,
                            productsModel:
                                controller.productsMap.keys.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: controller.productsMap.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
