import 'package:bunny_ear/pages/home/components/product_card.dart';
import 'package:flutter/material.dart';

class NewArrivalProduct extends StatelessWidget {
  const NewArrivalProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SectionTitle(
            title: "New Arrival",
            pressSeeAll:(){},
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
          ),
          scrollDirection: Axis.horizontal,
          child: Row(
            children:List.generate(
              demo_product.length, (index) => 
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ProductCard(
                    title: demo_product[index].title,
                    image: demo_product[index].image,
                    price: demo_product[index].price,
                    bgColor: demo_product[index].bgColor,
                    press: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(product: demo_product[index]),
                        )
                      );
                    },
                  ),
                )
            ),
          ),
        ),
      ],
    );
  }
}