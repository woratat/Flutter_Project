import 'dart:convert';

import 'package:bunny_ear/models/Product.dart';
import 'package:bunny_ear/pages/detail/detail.dart';
import 'package:bunny_ear/pages/home/components/product_card2.dart';
import 'package:bunny_ear/pages/home/components/section_title.dart';
import 'package:bunny_ear/pages/home/components/see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SectionTitle(
            title: "All Products",
            pressSeeAll: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeeAllPage(title: "All Products"),
                  ));
            },
          ),
        ),
        FutureBuilder(
            future: ReadJsonData(),
            builder: (context, data) {
        return GridView.count(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          padding: const EdgeInsets.all(0.0),
          children: List.generate(10, (index) {
            var items = data.data as List<Product>;
            return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(product: items[index]),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ProductCard2(
                        title: items[index].title,
                        image: items[index].images[0],
                        price: items[index].price,
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(product: items[index]),
                              ));
                        },
                      ),
                    ),
                  );
          }),
        );
        })
      ],
    );
  }
}

Future<List<Product>> ReadJsonData() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('assets/json/products.json');
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => Product.fromJson(e)).toList();
}
