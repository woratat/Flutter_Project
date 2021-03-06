import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/models/Product.dart';
import 'package:bunny_ear/pages/detail/detail.dart';
import 'package:bunny_ear/pages/home/components/subPage/all_products.dart';
import 'package:bunny_ear/pages/home/components/subPage/earClips_page.dart';
import 'package:bunny_ear/pages/home/components/subPage/headphones_page.dart';
import 'package:bunny_ear/pages/home/components/subPage/true_wireless_page.dart';
import 'package:bunny_ear/pages/home/components/subPage/in_ear_page.dart';
import 'package:bunny_ear/pages/home/home.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:bunny_ear/pages/home/components/subPage/new_avrrival_page.dart';
import 'package:bunny_ear/pages/home/components/subPage/popular_page.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SeeAllPage extends StatefulWidget {
  final String title;

  const SeeAllPage({Key? key, required this.title}) : super(key: key);

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.title == "New Arrival") {
      return newArrivalPage(context);
    } else if (widget.title == "Popular") {
      return popular_page(context);
    } else if (widget.title == "Headphones") {
      return headPhonesPage(context);
    } else if (widget.title == "True Wireless") {
      return trueWirelessPage(context);
    } else if (widget.title == "All Products") {
      return AllProductsPage(context);
    } else if (widget.title == "In Ear") {
      return InEarPage(context);
    }else if (widget.title == "Ear Clips") {
      return earClipsPage(context);
    } else {
      return Text("Not Found");
    }
  }
}
