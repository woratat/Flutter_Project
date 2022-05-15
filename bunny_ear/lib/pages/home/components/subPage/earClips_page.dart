import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/models/Product.dart';
import 'package:bunny_ear/pages/detail/detail.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

import 'package:flutter/material.dart';

Scaffold earClipsPage(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title:Text("Ear Clips"),
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
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 5
                          )
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                          items[index].images[0]
                          ),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Center(
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(8,0,8,0),
                              child: Container(
                                color: Color(0xFFEBEBEBE),
                                height: 1,
                              ),
                            ),
                            SizedBox(
                              height: 35,
                              child: Stack(
                                children: [
                                  Container(decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                    color :Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text(items[index].title, overflow: TextOverflow.ellipsis),),
                                  )
                                ],
                              ),
                            )
                          ]
                        ) ,
                      )
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
        await rootBundle.rootBundle.loadString('assets/json/earClips.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Product.fromJson(e)).toList();
  }