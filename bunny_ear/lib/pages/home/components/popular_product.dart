import 'package:bunny_ear/pages/home/components/product_card.dart';
import 'package:bunny_ear/pages/home/components/section_title.dart';
import 'package:flutter/material.dart';

class PoppularProducts extends StatelessWidget {
  const PoppularProducts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SectionTitle(
            title: "Poppular",
            pressSeeAll:(){},
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent:  AlwaysScrollableScrollPhysics()
          ),
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
              List.generate(
                10, (index) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    // title: demo_product[index].title,
                    // image: demo_product[index].image,
                    // price: demo_product[index].price,
                    // bgColor: demo_product[index].bgColor,
                    //press: () {},
                  ),
                )
              )
          ),
        )
      ],
    );
  }
}