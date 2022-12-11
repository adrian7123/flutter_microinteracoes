import 'package:flutter/material.dart';
import 'package:flutter_microinteracoes/theme/my_theme.dart';
import 'package:flutter_microinteracoes/widgets/square_widget.dart';

class DoubleTapTab extends StatefulWidget {
  const DoubleTapTab({Key? key}) : super(key: key);
  @override
  _DoubleTapTabState createState() => _DoubleTapTabState();
}

class _DoubleTapTabState extends State<DoubleTapTab> {
  double size = 100;
  Color color = MyTheme.background;
  Duration animationDuration = Duration(milliseconds: 400);

  void doubleTap() {
    setState(() {
      color =
          color == MyTheme.background ? MyTheme.foreground : MyTheme.background;
      size = 250;
      Future.delayed(Duration(milliseconds: 600)).then(
        (_) => setState(() => size = 100),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Double Tap Muda de Cor",
          style: TextStyle(fontSize: 30, color: color),
        ),
        SizedBox(height: 30),
        GestureDetector(
          onDoubleTap: doubleTap,
          child: AnimatedContainer(
            curve: Curves.easeOutCirc,
            duration: animationDuration,
            height: size,
            width: size,
            child: SquareWidget(
              color: color,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
