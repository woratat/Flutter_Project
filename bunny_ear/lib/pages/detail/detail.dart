import 'package:bunny_ear/models/Product.dart';
import 'package:bunny_ear/pages/detail/components/add_cart.dart';
import 'package:bunny_ear/pages/detail/components/detail_app_bar.dart';
import 'package:bunny_ear/pages/detail/components/list_type_ear.dart';
import 'package:bunny_ear/pages/detail/components/product_detail_info.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({ Key? key, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenshotController _screenshotController = ScreenshotController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DetailAppBar(
              product: product,
              screenshotController: _screenshotController,
            ),
            ProductDetailInfo(product: product),
            ListTypeEar(),
            AddCart(product: product),
          ],
        ),
      ),
    );
  }
}