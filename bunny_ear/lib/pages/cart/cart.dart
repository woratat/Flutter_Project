import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/pages/cart/components/cart_app_bar.dart';
import 'package:bunny_ear/pages/cart/components/cart_body.dart';
import 'package:bunny_ear/pages/cart/components/checkout_card.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: cartAppBar(context),
      body: CartBody(),
      bottomNavigationBar: CheckoutCard(),
    );
  }
}