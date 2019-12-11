import 'dart:math';

import 'package:flutter/material.dart';

class FlipWidget extends StatelessWidget {
  final Widget child;

  const FlipWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Offset _offset = Offset(0.3, 0.7);

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LayoutBuilder(
            builder: (context, constraints) {
              print(constraints.minHeight);

              return Container(
                color: Colors.pinkAccent,
                child: Padding(
                  padding: EdgeInsets.only(bottom: constraints.minHeight * .25),
                  child: child,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, -0.001)
              ..rotateX(pi)
              ..rotateX(_offset.dy * 1.2),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Align(
                child: child,
                alignment: Alignment.bottomCenter,
                heightFactor: .25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
