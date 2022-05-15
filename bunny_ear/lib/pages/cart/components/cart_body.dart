import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/models/CartProduct.dart';
import 'package:bunny_ear/models/Product.dart';
import 'package:bunny_ear/pages/cart/components/cart_item_card.dart';
import 'package:bunny_ear/pages/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartBody extends StatelessWidget {
  const CartBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Slidable(
              key: const ValueKey(0),
              startActionPane: ActionPane(
                dragDismissible: false,
                motion: StretchMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: <SlidableAction>[
                  SlidableAction(
                    onPressed: (context) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            product: new Product( // รอ content
                              title: 'FiR Audio VxV',
                              subtitle: 'FiR Audio',
                              description: 'wow',
                              images: [
                                'https://iconic-music.net/wp-content/uploads/2021/11/IMG_7103-600x438.jpg'
                              ],
                              price: 39990,
                            ),
                          ),
                        ),
                      );
                    },
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    icon: Icons.more_horiz_outlined,
                    label: 'More',
                  ),
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: StretchMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: <SlidableAction>[
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: CartItemCard(
                cartProduct: new CartProduct(
                  product: new Product(
                    title: 'FiR Audio VxV',
                    subtitle: 'FiR Audio',
                    description: 'wow',
                    images: [
                      'https://iconic-music.net/wp-content/uploads/2021/11/IMG_7103-600x438.jpg'
                    ],
                    price: 39990,
                  ),
                  quantity: 3,
                  type: 'custom',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}