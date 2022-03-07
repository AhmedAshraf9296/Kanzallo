import 'package:flutter/material.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/images/check.png',
              color: Colors.purple.withOpacity(.60),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
          width: 15,
        ),
        Row(
          children: const [
            TextUtils(
              "I Accept  ",
              16,
              FontWeight.normal,
              Colors.black,
              TextDecoration.none,
            ),
            TextUtils(
              "terms & conditions",
              16,
              FontWeight.normal,
              Colors.black,
              TextDecoration.underline,
            ),
          ],
        )
      ],
    );
  }
}
