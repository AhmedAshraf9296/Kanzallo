import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/auth_controller.dart';
import 'package:kanzalloshop/logic/Controller/payment_controller.dart';
import 'package:kanzalloshop/routes/routes.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  final TextEditingController phoneController = TextEditingController();
  int radioContainerIndex = 1;
  bool changeColor = false;
  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
            address: "Ahmedaaaaaaa",
            name: "Ahmed Ashraf",
            phone: "01152875815",
            title: "Kanzallo",
            value: 1,
            color: changeColor ? Colors.white : Colors.grey.shade700,
            icon: Container(),
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColor = !changeColor;
              });
            }),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => buildRadioContainer(
              address: controller.address.value,
              name: authController.displayUserName.value,
              phone: controller.phoneNumber.value,
              title: "delivery",
              value: 2,
              color: changeColor ? Colors.grey.shade700 : Colors.white,
              icon: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Enter your phone number",
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.white,
                    radius: 10,
                    textCancel: " Cancel ",
                    cancelTextColor:
                        Get.isDarkMode ? Colors.white : Colors.black,
                    textConfirm: " Save ",
                    confirmTextColor:
                        Get.isDarkMode ? Colors.black : Colors.white,
                    onCancel: () {
                      Get.toNamed(Routes.paymentScreen);
                    },
                    onConfirm: () {
                      Get.back();
                      controller.phoneNumber.value = phoneController.text;
                    },
                    buttonColor: Get.isDarkMode ? greenColor : mainColor,
                    content: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: phoneController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        onSubmitted: (value) {
                          phoneController.text = value;
                        },
                        maxLength: 11,
                        decoration: InputDecoration(
                          fillColor: Get.isDarkMode
                              ? greenColor.withOpacity(0.2)
                              : mainColor.withOpacity(0.2),
                          focusColor: Colors.red,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Get.isDarkMode ? greenColor : mainColor,
                          ),
                          hintText: "Enter your phone number",
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              phoneController.clear();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.contact_phone,
                  size: 20,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
              ),
              onChanged: (int? value) {
                setState(() {
                  radioContainerIndex = value!;
                  changeColor = !changeColor;
                });
                controller.updatePosition();
              }),
        )
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(
                0.2,
              ),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            fillColor:
                MaterialStateColor.resolveWith((states) => Colors.redAccent),
            groupValue: radioContainerIndex,
            value: value,
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  title,
                  20,
                  FontWeight.bold,
                  Colors.black,
                  TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  name,
                  15,
                  FontWeight.normal,
                  Colors.black,
                  TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text("🇪🇬+02 "),
                    TextUtils(
                      phone,
                      15,
                      FontWeight.normal,
                      Colors.black,
                      TextDecoration.none,
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                // TextUtils(
                //   address,
                //   15,
                //   FontWeight.normal,
                //   Colors.black,
                //   TextDecoration.none,
                // ),
                Expanded(child: SizedBox(width: 250,child: Text(address,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal),)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
