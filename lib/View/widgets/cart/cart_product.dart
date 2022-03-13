import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/Model/products_model.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/cart_controller.dart';

class CartProduct extends StatelessWidget {
  final ProductsModel productsModel;
  final int index;
  final int quantity;
  final controller = Get.find<CartController>();
  CartProduct({
    Key? key,
    required this.productsModel,
    required this.index,
    required this.quantity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? greenColor.withOpacity(0.4)
              : mainColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(
                    productsModel.image,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  productsModel.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.removeOneProductFromCart(productsModel);
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.white,
                      )),
                   Text(
                    "$quantity",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.addProductToCart(productsModel);
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      )),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeProductsFromCart(productsModel);
                },
                icon: Icon(
                  Icons.delete,
                  color: Get.isDarkMode ? Colors.white60 : Colors.redAccent,
                  size: 20,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
