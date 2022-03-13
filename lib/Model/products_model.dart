
// import 'package:meta/meta.dart';
import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  ProductsModel({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.rating,
    required this.title,
  });

  Category ? category;
  String description;
  int id;
  String image;
  double price;
  Rating rating;
  String title;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    category: categoryValues.map![json["category"]],
    description: json["description"],
    id: json["id"],
    image: json["image"],
    price: json["price"].toDouble(),
    rating: Rating.fromJson(json["rating"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "category": categoryValues.reverse![category],
    "description": description,
    "id": id,
    "image": image,
    "price": price,
    "rating": rating.toJson(),
    "title": title,
  };
}

// ignore: constant_identifier_names
enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
    required this.count,
    required this.rate,
  });

  int count;
  double rate;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    count: json["count"],
    rate: json["rate"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "rate": rate,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> ? get reverse {
    reverseMap = map!.map((k, v) =>  MapEntry(v, k));
    return reverseMap;
  }
}
