import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/models/Product.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class AddCart extends StatefulWidget {
  final Product product;

  const AddCart({ Key? key, required this.product }) : super(key: key);

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  final format = new NumberFormat('#,##0.00', 'en_US');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Price',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${format.format(widget.product.price)} THB',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary: primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Add to cart',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.shopping_bag_outlined
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}