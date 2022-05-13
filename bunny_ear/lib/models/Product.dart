import 'package:flutter/material.dart';

class Product {
  final String title;
  final String image;
  final int price;

  Product({required this.title, required this.price, required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return new Product(
      title: json['title'],
      price: json['price'],
      image: json['image'],
    );
  }
}
