import 'package:bunny_ear/constant.dart';
import 'package:flutter/material.dart';

class ListTypeEar extends StatefulWidget {
  const ListTypeEar({ Key? key }) : super(key: key);

  @override
  State<ListTypeEar> createState() => _ListTypeEarState();
}

class _ListTypeEarState extends State<ListTypeEar> {
  final List<String> type = ['universal', 'custom'];
  int _currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              _currentSelected = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: _currentSelected == index ? secondColor.withOpacity(0.4) : Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: thirdColor,
                width: 2
              ),
            ),
            child: Text(
              type[index],
              style: TextStyle(
                color: _currentSelected == index ? primaryColor : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        separatorBuilder: (_, index) => SizedBox(width: 10),
        itemCount: type.length,
      ),
    );
  }
}