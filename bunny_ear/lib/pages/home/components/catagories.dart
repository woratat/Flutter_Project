import 'package:flutter/material.dart';
import 'package:bunny_ear/models/Category.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories_ear.length,
        itemBuilder: (context,index)=> CategoryCard(
          icon:categories_ear[index].icon,
          title:categories_ear[index].title,
          press:(){}
        ),
        separatorBuilder: (context,index)=>
        const SizedBox(width: 16),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({ 
    Key? key,
    required this.icon,
    required this.title,
    required this.press
  }) : super(key: key);

  final String icon,title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16 / 2,horizontal: 16 / 4),
        child: Column(
          children: [
            Image(image: NetworkImage(icon)),
            const SizedBox(height: 16 / 2),
            Text(title,style: Theme.of(context).textTheme.subtitle2)
          ]
        ),
      ),
    );
  }
}