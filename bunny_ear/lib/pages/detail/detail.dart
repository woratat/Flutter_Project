import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/models/Product.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({ Key? key, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_rounded),
          alignment: Alignment.center,
          splashColor: Colors.transparent,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: primaryColor,
              child: Icon(
                Icons.thumb_up_off_alt_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
            splashColor: primaryColor,
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Image(
                image: NetworkImage(product.image),
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0 * 3),
                    topRight: Radius.circular(12.0 * 3),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            product.title,
                            style: Theme.of(context).textTheme.headline6!,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}