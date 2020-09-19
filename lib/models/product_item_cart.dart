import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/foundation.dart';
import 'package:estructura_practica_1/models/product_repository.dart';

class ProductItemCart {
  String productTitle;
  int productAmount;
  double productPrice;
  ProductType typeOfProduct;
  String productImage;
  bool liked;
  ProductWeight productWeight;
  ProductSize productSize;
  String feature;

  ProductItemCart({
    @required this.typeOfProduct,
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
    @required this.productImage,
    @required this.liked,
    @required this.productWeight,
    @required this.productSize,
    @required this.feature,
  });
}
