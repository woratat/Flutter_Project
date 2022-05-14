import 'dart:async';
import 'dart:io';

import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/models/Product.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class DetailAppBar extends StatefulWidget {
  final Product product;

  const DetailAppBar({ Key? key, required this.product }) : super(key: key);

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  final CarouselController _controller = CarouselController();
  final ScreenshotController _screenshotController = ScreenshotController();
  int _currentPage = 0;

  Future<void> shareScreen() async {
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
    final String localPath = '${directory!.path}/${DateTime.now().toIso8601String()}.png';
    print(localPath);
    await _screenshotController.captureAndSave(localPath);
    await Future.delayed(Duration(seconds: 1));
    await FlutterShare.shareFile(
      title: 'shear image',
      filePath: localPath,
      fileType: 'image/png'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Screenshot(
        controller: _screenshotController,
        child: Stack(
          children: <Widget>[
            Container(
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  height: 500,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
                items: widget.product.images.map(
                  (e) => Builder(
                    builder: (context) => Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(e),
                          fit: BoxFit.fitHeight
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                    ),
                  )
                ).toList(),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 180,
              child: Row(
                children: widget.product.images.asMap().entries.map(
                  (entry) => GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 3
                      ),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor.withOpacity(
                          _currentPage == entry.key ? 0.9 : 0.4
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: 25,
                right: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 1
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: shareScreen,
                      icon: Icon(
                        Icons.share,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}