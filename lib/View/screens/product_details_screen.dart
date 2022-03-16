import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/Model/products_model.dart';
import 'package:kanzalloshop/View/widgets/productDetails/image_sliders.dart';
import 'package:kanzalloshop/View/widgets/productDetails/product_info.dart';
import 'package:kanzalloshop/View/widgets/productDetails/size_list.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';

import '../widgets/productDetails/add_cart.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductsModel productsModel;
  const ProductDetailsScreen({Key? key,required this.productsModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : mainColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                ImageSliders(
                  imageUrl:productsModel.image,
                ),
                ProductInfo(title: productsModel.title,productId: productsModel.id,rate: productsModel.rating.rate,description: productsModel.description,),
                const SizeList(),
                AddCart(price: productsModel.price,productsModel: productsModel,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
