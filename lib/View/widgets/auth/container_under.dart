import 'package:flutter/material.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() function;
  final String textType;

  const ContainerUnder(this.text, this.textType, this.function, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 80,
      decoration: BoxDecoration(
        color: secondalymainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text,
            18,
            FontWeight.bold,
            Colors.white,
            TextDecoration.none,
          ),
          TextButton(
            onPressed: function,
            child: TextUtils(
              textType,
              18,
              FontWeight.bold,
              Colors.white,
              TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
