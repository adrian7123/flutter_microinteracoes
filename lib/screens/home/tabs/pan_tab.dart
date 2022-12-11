import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_microinteracoes/widgets/square_widget.dart';

class PanTab extends StatefulWidget {
  const PanTab({Key? key}) : super(key: key);
  @override
  _PanTabState createState() => _PanTabState();
}

class _PanTabState extends State<PanTab> {
  double size = 200;
  Duration animationDuration = Duration(milliseconds: 200);
  double top = 0;
  double left = 0;

  void onPanUpdate([DragUpdateDetails? details]) {
    if (details != null) {
      setState(() {
        top = max(0, top + details.delta.dy);
        left = max(0, left + details.delta.dx);
      });
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      setState(() {
        top = (MediaQuery.of(context).size.height / 2) - size;
        left = (MediaQuery.of(context).size.width / 2) - size;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Pan",
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(height: 30),
        Flexible(
          child: Stack(
            children: [
              Positioned(
                top: top,
                left: left,
                child: GestureDetector(
                  onPanUpdate: onPanUpdate,
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
          ),
        ),
      ],
    );
  }
}
