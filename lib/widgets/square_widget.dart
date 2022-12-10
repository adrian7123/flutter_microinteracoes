import 'package:flutter/material.dart';
import 'package:flutter_microinteracoes/theme/my_theme.dart';

class SquareWidget extends StatelessWidget {
  final double height, width;
  final Color? color;
  const SquareWidget({
    Key? key,
    this.height = 100,
    this.width = 100,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color ?? MyTheme.background,
      ),
      width: width,
      height: height,
    );
  }
}
