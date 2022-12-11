import 'package:flutter/material.dart';
// import 'package:flutter_microinteracoes/gestures/rotate_gesture_reorganizer.dart';
// import 'package:flutter_microinteracoes/widgets/keymotion_gesture_detector.dart';
import 'package:flutter_microinteracoes/widgets/square_widget.dart';

class RotationTab extends StatefulWidget {
  const RotationTab({Key? key}) : super(key: key);
  @override
  _RotationTabState createState() => _RotationTabState();
}

class _RotationTabState extends State<RotationTab> {
  double size = 200;
  Duration animationDuration = Duration(milliseconds: 200);
  double angle = 0;

  void onScaleUpdate([ScaleUpdateDetails? details]) {
    if (details != null) {
      setState(() {
        angle = details.rotation;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Rotate",
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(height: 30),
        GestureDetector(
          onScaleUpdate: onScaleUpdate,
          child: AnimatedContainer(
            curve: Curves.decelerate,
            duration: animationDuration,
            height: size,
            width: size,
            child: Transform.rotate(
              angle: angle,
              child: SquareWidget(
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
        ),
        // KeymotionGestureDetector(
        //   onRotationUpdate: onRotationUpdate,
        //   child: AnimatedContainer(
        //     curve: Curves.bounceOut,
        //     duration: animationDuration,
        //     height: size,
        //     width: size,
        //     child: Transform.rotate(
        //       angle: angle,
        //       child: SquareWidget(
        //         height: double.infinity,
        //         width: double.infinity,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
