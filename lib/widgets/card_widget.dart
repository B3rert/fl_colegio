import 'package:flutter/material.dart';

class Cardwidget extends StatelessWidget {
  const Cardwidget({
    Key? key,
    this.color = const Color.fromRGBO(45, 49, 65, 255),
    required this.borderRadius,
    required this.width,
    required this.height,
    required this.content,
  }) : super(key: key);

  final Color? color;
  final double borderRadius;
  final double width;
  final double height;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        clipBehavior: Clip.antiAlias,
        child: content,
      ),
    );
  }
}
