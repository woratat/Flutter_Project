import 'package:bunny_ear/models/Product.dart';
import 'package:bunny_ear/pages/detail/components/detail_app_bar.dart';
import 'package:bunny_ear/pages/detail/components/product_detail_info.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({ Key? key, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DetailAppBar(product: product),
            ProductDetailInfo(product: product),
          ],
        ),
      ),
    );
  }
}