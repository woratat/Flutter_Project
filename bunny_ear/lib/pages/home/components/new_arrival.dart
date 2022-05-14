import 'package:bunny_ear/models/Product.dart';
import 'package:bunny_ear/pages/home/components/product_card.dart';
import 'package:bunny_ear/pages/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class NewArrivalProduct extends StatefulWidget {
  const NewArrivalProduct({Key? key}) : super(key: key);

  @override
  State<NewArrivalProduct> createState() => _NewArrivalProductState();
}

class _NewArrivalProductState extends State<NewArrivalProduct> {
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
                          title: "New Arrival",
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
      await rootBundle.rootBundle.loadString('assets/json/Product.json');
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => Product.fromJson(e)).toList();
}
