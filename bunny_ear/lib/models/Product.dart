import 'package:flutter/material.dart';

class Product {
  final String title;
  final String subtitle;
  final String description;
  final List<dynamic> images;
  final int price;

  Product({
    required this.title, 
    required this.price, 
    required this.images,
    required this.subtitle,
    required this.description
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return new Product(
      title: json['title'],
      price: json['price'],
      images: json['images'],
      subtitle: json['subtitle'],
      description: json['description']
    );
  }
}
