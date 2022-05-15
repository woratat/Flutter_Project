import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/models/CartProduct.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartItemCard extends StatelessWidget {
  final CartProduct cartProduct;

  const CartItemCard({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = new NumberFormat('#,##0.00', 'en_US');

    return Row(
      children: <Widget>[
        SizedBox(
          width: 90,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Image(
                  image: NetworkImage(cartProduct.product.images[0]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              cartProduct.product.title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              cartProduct.product.subtitle,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.grey, 
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: 'THB ${format.format(cartProduct.product.price)}',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' x${cartProduct.quantity}',
                        style: TextStyle(
                          color: primaryColor.withOpacity(1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  cartProduct.type,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}