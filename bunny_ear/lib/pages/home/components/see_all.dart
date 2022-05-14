
import 'dart:math';

import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/models/Product.dart';
import 'package:bunny_ear/pages/detail/detail.dart';
import 'package:bunny_ear/pages/home/home.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SeeAllPage extends StatefulWidget {

  final String title;

  const SeeAllPage({ Key? key , required this.title }) : super(key: key);

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {

  @override
  Widget build(BuildContext context) {

    if(widget.title =="New Arrival"){
      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title:Text(widget.title),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
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
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8,135,8,5),
                                child: Container(
                                  color: Color(0xFFEBEBEBE),
                                  height: 1,
                                ),
                              ),
                              Text(items[index].title)
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
    } else if(widget.title =="Popular"){
      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title:Text(widget.title),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
            alignment: Alignment.center,
            splashColor: Colors.transparent,
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
            ),
            FutureBuilder(
              future: ReadJsonData2(),
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
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8,135,8,5),
                                child: Container(
                                  color: Color(0xFFEBEBEBE),
                                  height: 1,
                                ),
                              ),
                              Text(items[index].title),
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
    else{
      return Text("data");
    }

  }

  Future<List<Product>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/json/Product.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> ReadJsonData2() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/json/popularProduct.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Product.fromJson(e)).toList();
  }

}