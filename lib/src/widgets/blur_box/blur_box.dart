import 'dart:ui';

import 'package:flutter/material.dart';

class BlurBox extends StatelessWidget {
  final Widget child;
  final double sigmaX;
  final double sigmaY;

  BlurBox({
    @required this.child,
    this.sigmaX = 10.0,
    this.sigmaY = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX,
          sigmaY: sigmaY,
        ),
        child: child,
      ),
    );
  }
}
