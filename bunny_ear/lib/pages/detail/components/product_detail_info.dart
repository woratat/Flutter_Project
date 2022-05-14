import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/models/Product.dart';
import 'package:flutter/material.dart';

class ProductDetailInfo extends StatelessWidget {
  final Product product;

  const ProductDetailInfo({ Key? key, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${product.title}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle
                ),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
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
          RichText(
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'The company FiR Audio has been in the market since 2018. But their owner and founder has been in the game far longer. Bogdan Belonozhko has been heavily involved with the operations of 64 Audio. Before he left 64 Audio he was their CEO.' +
                        'In 2018 Bogdan decided to do his own thing and to develop products that fill a niche market in the already niche audiophile segment. He started out building vacuum cleaners for IEMs before he moved on to cables to finally land on IEMs. Which he introduced at 2019’s CanJam Singapore. Here his first creations have been shown to the public.' +
                        'Unlike the majority of IEMs out there in the wild, his products are completely tube-less. It’s a design that we have already seen with 64 Audio’s Tia Fourté and Tia Trió. However, Bogdan went a step further and announced that his units are also available as tube-less custom IEMs. Something many people, me included, have been requesting from 64 Audio for a long time.' +
                        'FiR Audio also produces a set of dry cleaners and a cable tester. A complete suite of IEM care and maintenance products to keep your monitors alive and at their best performance. For many weeks FiR Audio also teased a new measurement device to check for faulty drivers. Personally, I’m looking forward to that one myself, but sadly it hasn’t made it past the prototype stage yet',
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.7),
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: 'Read More',
                  style: TextStyle(
                    color: primaryColor.withOpacity(0.9),
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}