import 'package:fl_colegio/theme/app_theme.dart';
import 'package:flutter/material.dart';

class GradientButtonWidget extends StatelessWidget {
  const GradientButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    this.radius = 20,
  }) : super(key: key);

  final Function? onTap;
  final String text;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap == null ? null : () => onTap!(),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          gradient: LinearGradient(
            colors: [
              onTap == null ? const Color(0xFFE0E0E0) : AppTheme.primary,
              onTap == null ? const Color(0xFFE0E0E0) : const Color(0xFF584CD1),
            ],
            begin: const FractionalOffset(0.2, 0.0),
            end: const FractionalOffset(1.0, 0.6),
            stops: const [0.0, 0.6],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: onTap == null ? const Color(0xFF9E9E9E) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
