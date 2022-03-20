import 'package:flutter/material.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  _PaymentMethodWidgetState createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPaymentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            buildRadioPayment(
                name: "PayPal",
                image: "assets/images/paypal.png",
                scale: 0.7,
                value: 1,
                onChanged: (int? value) {
                  setState(() {
                    radioPaymentIndex = value!;
                  });
                }),
            const SizedBox(
              height: 15,
            ),
            buildRadioPayment(
                name: "GooglePay",
                image: "assets/images/google.png",
                scale: 0.8,
                value: 2,
                onChanged: (int? value) {
                  setState(() {
                    radioPaymentIndex = value!;
                  });
                }),
            const SizedBox(
              height: 15,
            ),
            buildRadioPayment(
                name: "Credit Card",
                image: "assets/images/credit.png",
                scale: 0.7,
                value: 3,
                onChanged: (int? value) {
                  setState(() {
                    radioPaymentIndex = value!;
                  });
                }),
          ],
        ));
  }

  Widget buildRadioPayment(
      {required String image,
      required double scale,
      required String name,
      required int value,
      required Function onChanged}) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.withOpacity(0.7)),
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                name,
                25,
                FontWeight.bold,
                Colors.black,
                TextDecoration.none,
              ),
            ],
          ),
          Radio(
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            value: value,
            groupValue: radioPaymentIndex,
            onChanged: (int? value) {
              onChanged(value);
            },
          )
        ],
      ),
    );
  }
}
