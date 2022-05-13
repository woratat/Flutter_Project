import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.bgColor,
  }) : super(key: key);

  final String image, title;
  final int price;
  final Color bgColor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
