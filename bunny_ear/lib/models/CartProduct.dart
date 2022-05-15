import 'package:bunny_ear/models/Product.dart';
import 'package:flutter/material.dart';

class CartProduct {
  final Product product;
  final int quantity;
  final String type;

  const CartProduct({
    required this.product,
    required this.quantity,
    required this.type,
  });
}

List<CartProduct> cartItem = [];