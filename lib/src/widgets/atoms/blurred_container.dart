import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double sigmaX;
  final double sigmaY;
  final double borderRadius;
  final double opacity;
  final Color color;
  final AlignmentGeometry alignment;

  BlurredContainer({
    @required this.child,
    this.width,
    this.height,
    this.sigmaX = 10.0,
    this.sigmaY = 10.0,
    this.borderRadius = 20.0,
    this.opacity = 0.5,
    this.color = Colors.black,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX,
          sigmaY: sigmaY,
        ),
        child: Container(
          alignment: Alignment.topCenter,
          child: child,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
