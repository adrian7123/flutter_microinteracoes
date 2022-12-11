import 'package:flutter/material.dart';
import 'package:flutter_microinteracoes/widgets/square_widget.dart';

class PinchTab extends StatefulWidget {
  const PinchTab({Key? key}) : super(key: key);
  @override
  _PinchTabState createState() => _PinchTabState();
}

class _PinchTabState extends State<PinchTab> {
  double size = 200;
  Duration animationDuration = Duration(milliseconds: 200);
  double scale = 1;

  void onScaleUpdate([ScaleUpdateDetails? details]) {
    if (details != null) {
      setState(() {
        scale = details.scale;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Pinch",
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(height: 30),
        Transform.scale(
          scale: scale,
          child: GestureDetector(
            onScaleUpdate: onScaleUpdate,
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
        ),
      ],
    );
  }
}
