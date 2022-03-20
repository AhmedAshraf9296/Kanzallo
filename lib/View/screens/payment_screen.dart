import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/payment/delivery_container_widget.dart';
import 'package:kanzalloshop/View/widgets/payment/payment_method_widget.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      appBar: AppBar(
        title: const Text("Payment"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? Colors.black : mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                "Shipping To",
                24,
                FontWeight.bold,
                Get.isDarkMode ? Colors.black : Colors.white,
                TextDecoration.none,
              ),
              const SizedBox(
                height: 20,
              ),
              const DeliveryContainerWidget(),
              const SizedBox(
                height: 20,
              ),
              TextUtils(
                "Payment Method",
                24,
                FontWeight.bold,
                Get.isDarkMode ? Colors.black : Colors.white,
                TextDecoration.none,
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentMethodWidget(),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: TextUtils(
                  "Total: 200\$",
                  20,
                  FontWeight.bold,
                  Get.isDarkMode ? Colors.black : Colors.white,
                  TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                      elevation: 0,
                      primary: Get.isDarkMode?greenColor: mainColor.withRed(80),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Pay Now",style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                    ),
                  ),
                ),
              ),
              // TotalButton(),
            ],
          ),
        ),
      ),
    );
  }
}
