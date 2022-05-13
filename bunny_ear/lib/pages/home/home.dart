import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/pages/home/components/search_form.dart';
import 'package:bunny_ear/pages/home/components/section_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.menu,
              color: primaryColor,
            ),
          ),
          splashColor: Colors.transparent,
          highlightColor: secondColor,
          hoverColor: Colors.transparent,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: primaryColor,
            ),
            const SizedBox(width: 8),
            Text(
              "RX22+55J, Sukhothai 5 Alley, Chiang Mai 50200",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.transparent,
                child: Icon(Icons.notifications_active_outlined,
                    color: primaryColor)),
            splashColor: Colors.transparent,
            highlightColor: secondColor,
            hoverColor: Colors.transparent,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const Text(
              "Astonishing sound. Wherever life takes you.",
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: SearchForm(),
            ),
            // const Categories(),
            // const NewArrivalProducts(),
            // const PopularProducts(),
          ],
        ),
      ),
    );
  }
}
