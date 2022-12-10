import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_microinteracoes/widgets/square_widget.dart';

class LongPressTab extends StatefulWidget {
  const LongPressTab({Key? key}) : super(key: key);
  @override
  _LongPressTabState createState() => _LongPressTabState();
}

class _LongPressTabState extends State<LongPressTab> {
  double size = 100;
  Duration animationDuration = Duration(milliseconds: 200);

  void onLongPressDown([LongPressDownDetails? details]) {
    setState(() {
      size = 200;
    });
  }

  void onLongPressEnd([LongPressEndDetails? details]) {
    setState(() {
      size = 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Pressionar por muito tempo muda o tamanho",
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(height: 30),
        GestureDetector(
          onLongPressDown: onLongPressDown,
          onLongPressEnd: onLongPressEnd,
          onLongPressCancel: onLongPressEnd,
          child: AnimatedContainer(
            curve: Curves.decelerate,
            duration: animationDuration,
            height: size,
            width: size,
            child: SquareWidget(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
