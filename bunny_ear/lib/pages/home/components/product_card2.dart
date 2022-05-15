import 'package:bunny_ear/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard2 extends StatelessWidget {
  const ProductCard2({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
  }) : super(key: key);

  
  final String image, title;
  final int price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {

    final format = new NumberFormat('#,##0.00','en_US');

    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.network(
                image,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 10),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "THB ${format.format(price)}",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 8
                  ),
                  
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
