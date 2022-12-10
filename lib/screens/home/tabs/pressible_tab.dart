import 'package:flutter/material.dart';
import 'package:flutter_microinteracoes/widgets/square_widget.dart';

class PressableTab extends StatefulWidget {
  const PressableTab({Key? key}) : super(key: key);
  @override
  _PressableTabState createState() => _PressableTabState();
}

class _PressableTabState extends State<PressableTab> {
  double size = 150;
  Duration animationDuration = Duration(milliseconds: 400);

  void onTapDown(TapDownDetails? details) {
    setState(() {
      size = 300;
    });
  }

  void onTapUp([TapUpDetails? details]) {
    setState(() {
      size = 150;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Pressionar muda o tamanho",
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(height: 30),
        GestureDetector(
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onTapCancel: onTapUp,
          child: AnimatedContainer(
            curve: Curves.bounceOut,
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
