import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../utils/helper.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final Image image;
  const Category({
    required this.id,
    required this.name,
    required this.image,
  });
  @override
  List<Object?> get props => [id, name, image];

  static List<Category> categories = [
    Category(
      id: 1,
      name: "burger",
      image: Image.asset(
        Helper.getAssetName("burger.png", "real"),
      ),
    ),
    Category(
      id: 2,
      name: "burger",
      image: Image.asset(
        Helper.getAssetName("burger2.png", "real"),
      ),
    ),
    Category(
      id: 3,
      name: "Pizza",
      image: Image.asset(
        Helper.getAssetName("pizza.png", "real"),
      ),
    ),
    Category(
      id: 4,
      name: "Sandwich",
      image: Image.asset(
        Helper.getAssetName("sandwich.png", "real"),
      ),
    ),
    Category(
      id: 5,
      name: "sandwich",
      image: Image.asset(
        Helper.getAssetName("sandwich2.png", "real"),
      ),
    ),
  ];
}
