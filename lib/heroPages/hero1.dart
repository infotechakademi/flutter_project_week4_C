import 'dart:math';

import 'package:flutter/material.dart';

import 'hero2.dart';

class MyHeroPage1 extends StatefulWidget {
  @override
  _MyHeroPage1State createState() => _MyHeroPage1State();
}

class _MyHeroPage1State extends State<MyHeroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          Color randomColor = Color.fromRGBO(Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255), 1);
          String heroTag = "tag$index";
          return GestureDetector(
            child: Hero(
              tag: heroTag,
              child: Card(
                color: randomColor,
                child: GridTile(
                  child: FittedBox(
                    child: Icon(
                      Icons.landscape_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyHeroPage2(randomColor, heroTag);
              }));
            },
          );
        },
      ),
    );
  }
}
