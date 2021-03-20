import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedPage extends StatefulWidget {
  @override
  _MyAnimatedPageState createState() => _MyAnimatedPageState();
}

class _MyAnimatedPageState extends State<MyAnimatedPage> {
  double containerHeight;
  double containerWidth;
  int colorIndex = 0;
  List<Color> colorList = [Colors.green, Colors.blue, Colors.purple];
  double x, y;

  _randomPosition() {
    setState(() {
      x = Random().nextDouble() * 2 - 1;
      y = Random().nextDouble() * 2 - 1;
    });
  }

  Widget myAnimatedContainerWidget() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      // container arguments
      height: containerHeight,
      width: containerWidth,
      color: colorList[colorIndex],
    );
  }

  Widget myAnimatedAlignWidget() {
    return AnimatedAlign(
      duration: Duration(seconds: 1),
      // container arguments
      alignment: Alignment(x, y),
      child: Icon(Icons.circle, size: 42),
    );
  }

  resetContainerWidget() {
    setState(() {
      containerHeight = 75;
      containerWidth = 75;
    });
  }

  resetAlignWidget() {
    setState(() {
      x = 0;
      y = 0;
    });
  }

  @override
  void initState() {
    resetContainerWidget();
    resetAlignWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Center(child: myAnimatedContainerWidget()),
                  Positioned.fill(
                    child: myAnimatedAlignWidget(),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                  color: Colors.grey.shade200,
                  child: ListView(
                    children: [
                      Text("Yükseklik"),
                      Slider(
                          min: 0,
                          max: 150,
                          divisions: 2,
                          value: containerHeight,
                          onChanged: (newValue) {
                            setState(() {
                              containerHeight = newValue;
                            });
                          }),
                      Text("Genişlik"),
                      Slider(
                          min: 0,
                          max: 150,
                          divisions: 2,
                          value: containerWidth,
                          onChanged: (newValue) {
                            setState(() {
                              containerWidth = newValue;
                            });
                          }),
                      Text("Renk"),
                      Slider(
                          min: 0,
                          max: (colorList.length - 1).toDouble(),
                          divisions: 2,
                          value: colorIndex.toDouble(),
                          onChanged: (newValue) {
                            setState(() {
                              colorIndex = newValue.toInt();
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _randomPosition();
                          },
                          child: Text("Rastgele konumlandır"),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
