import 'dart:convert';

import 'package:bunny_ear/models/Product.dart';
import 'package:bunny_ear/pages/home/components/product_card.dart';
import 'package:bunny_ear/pages/home/components/section_title.dart';
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
    // return Column(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 16),
    //       child: SectionTitle(
    //         title: "Popular",
    //         pressSeeAll: () {},
    //       ),
    //     ),
    //     GridView.count(
    //       scrollDirection: Axis.vertical,
    //       shrinkWrap: true,
    //       crossAxisCount: 2,
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 10,
    //       padding: const EdgeInsets.all(8.0),
    //       children: List.generate(12, (index) {
    //         return DecoratedBox(
    //             child: Text('Item ${index}'),
    //             decoration: BoxDecoration(
    //                 image: DecorationImage(
    //                     image: NetworkImage(
    //                         "https://www.munkonggadget.com/Images/product/option6757_30720_800x600.jpg"))));
    //       }),
    //     ),
    //   ],
    // );

    // return Container(
    //   child: FutureBuilder(
    //     future: ReadJsonData(),
    //     builder: (context, data) {
    //       if (data.hasError) {
    //         return Center(child: Text("${data.error}"));
    //       } else if (data.hasData) {
    //         var items = data.data as List<Product>;
    //         return GridView.builder(
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 2),
    //             itemCount: items == null ? 0 : 1,
    //             itemBuilder: (context, index) {
    //               return Column(
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(vertical: 16),
    //                     child: SectionTitle(
    //                       title: "Popular",
    //                       pressSeeAll: () {},
    //                     ),
    //                   ),
    //                   GridView.count(
    //                     scrollDirection: Axis.vertical,
    //                     shrinkWrap: true,
    //                     crossAxisCount: 2,
    //                     crossAxisSpacing: 10,
    //                     mainAxisSpacing: 10,
    //                     padding: const EdgeInsets.all(8.0),
    //                     children: List.generate(items.length, (index) {
    //                       return ProductCard(
    //                         title: items[index].title,
    //                         image: items[index].image,
    //                         price: items[index].price,
    //                         press: () {},
    //                       );
    //                     }),
    //                   ),
    //                 ],
    //               );
    //             });
    //       } else {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //     },
    //   ),
    // );
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
                          pressSeeAll: () {},
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
                                image: items[index].image,
                                price: items[index].price,
                                press: () {},
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
