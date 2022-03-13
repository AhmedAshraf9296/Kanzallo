import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/cart_controller.dart';

class CartTotal extends StatelessWidget {
  final controller = Get.find<CartController>();
    CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      Container(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextUtils(
                  "Total",
                  16,
                  FontWeight.bold,
                  Colors.grey,
                  TextDecoration.none,
                ),
                Text(
                  "\$${controller.productTotal}",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
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
                      primary: Get.isDarkMode ? greenColor : mainColor),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Check Out",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
