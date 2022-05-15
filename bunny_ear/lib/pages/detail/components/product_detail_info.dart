import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailInfo extends StatelessWidget {
  final Product product;

  const ProductDetailInfo({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            direction: Axis.horizontal,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${product.title}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.favorite_outline,
                  color: primaryColor,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.star_border,
                  color: Colors.yellow,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    left: 3,
                  ),
                  child: Text(
                    '4.5 (2.7k)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
          ReadMoreText(
            product.description,
            trimLines: 3,
            colorClickableText: primaryColor.withOpacity(0.9),
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            style: TextStyle(
              color: Colors.grey.withOpacity(0.7),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
