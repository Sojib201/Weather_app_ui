import 'package:flutter/material.dart';
class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path()
      ..lineTo(width * 0.4, 0)
      ..quadraticBezierTo(width * 0.5, height * 0.5, width * 0.6, 0)
      ..lineTo(width, 0)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

