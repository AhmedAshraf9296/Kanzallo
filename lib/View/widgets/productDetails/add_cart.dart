import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/Model/products_model.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/cart_controller.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductsModel productsModel;
  final controller = Get.find<CartController>();
   AddCart({Key? key, required this.productsModel, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextUtils(
                  "Price",
                  16,
                  FontWeight.bold,
                  Colors.grey,
                  TextDecoration.none,
                ),
                Text(
                  "\$$price",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0,
                        primary: Get.isDarkMode
                            ? greenColor
                            : pinkClr.withOpacity(0.6)),
                    onPressed: () {
                      controller.addProductToCart(productsModel);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.shopping_cart_outlined),
                      ],
                    )),
              ),
            )
          ],
        ));
  }
}
