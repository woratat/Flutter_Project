import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/models/Product.dart';
import 'package:bunny_ear/pages/detail/detail.dart';
import 'package:bunny_ear/pages/home/components/product_card2.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

import 'package:flutter/material.dart';

Scaffold InEarPage(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title:Text("In Ear"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          alignment: Alignment.center,
          splashColor: Colors.transparent,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:4),
          ),
          FutureBuilder(
            future: ReadJsonData(),
            builder: (context,data){
              var items = data.data as List<Product>;
              return GridView.count(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.all(8.0),
                children: List.generate(items.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) =>
                          DetailPage(product: items[index]),
                        )
                      );
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
                }
                ),
              );
            }
          )
          
        ],
      ),
    );
}


  Future<List<Product>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/json/inEar.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Product.fromJson(e)).toList();
  }