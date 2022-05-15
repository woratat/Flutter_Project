import 'dart:convert';

import 'package:bunny_ear/models/Product.dart';
import 'package:bunny_ear/pages/detail/detail.dart';
import 'package:bunny_ear/pages/home/components/product_card.dart';
import 'package:bunny_ear/pages/home/components/section_title.dart';
import 'package:bunny_ear/pages/home/components/see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class PopularProducts extends StatefulWidget {
  const PopularProducts({ Key? key }) : super(key: key);

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<Product>;
            return ListView.builder(
                itemCount: items == null ? 0 : 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: SectionTitle(
                          title: "Popular",
                          pressSeeAll: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  SeeAllPage(title: "Popular"),
                              )
                            );
                          },
                        ),
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            items.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: ProductCard(
                                title: items[index].title,
                                image: items[index].images[0],
                                price: items[index].price,
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(product: items[index]),
                                    )
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );

  }
}

Future<List<Product>> ReadJsonData() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('assets/json/popularProduct.json');
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => Product.fromJson(e)).toList();
}
