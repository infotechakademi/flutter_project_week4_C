import 'package:flutter/material.dart';

class MyHeroPage2 extends StatelessWidget {
  final Color _color;
  final String _heroTag;
  MyHeroPage2(this._color, this._heroTag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AspectRatio(
        aspectRatio: 1,
        child: Hero(
          tag: _heroTag,
          child: Card(
            color: _color,
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
      ),
    );
  }
}
