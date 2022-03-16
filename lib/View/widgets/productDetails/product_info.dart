import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/products_controller.dart';
import 'package:readmore/readmore.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;

  ProductInfo(
      {Key? key,
      required this.title,
      required this.productId,
      required this.rate,
      required this.description})
      : super(key: key);

  final controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Obx(() => Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.grey.withOpacity(0.8).withOpacity(0.8)
                          : Colors.grey.withOpacity(0.8).withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.manageFavorites(productId);
                      },
                      child: controller.isFavorites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextUtils(
                "$rate",
                14,
                FontWeight.bold,
                Get.isDarkMode ? Colors.black : Colors.white,
                TextDecoration.none,
              ),
              const SizedBox(
                width: 8,
              ),
              RatingBar.builder(
                initialRating: rate,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemSize: 28,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                unratedColor: Colors.grey,
                onRatingUpdate: (rating) {
                  rating = rate;
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: " Show More ",
            trimExpandedText: " Show Less ",
            trimMode: TrimMode.Line,
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.black : pinkClr,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.black : pinkClr,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
