import 'package:bunny_ear/constant.dart';
import 'package:flutter/material.dart';

AppBar cartAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: primaryColor,
    centerTitle: true,
    elevation: 0,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Your Cart',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '4 items',
          style: Theme.of(context).textTheme.caption!.copyWith(
            color: Colors.white,
          ),
        )
      ],
    ),
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
}