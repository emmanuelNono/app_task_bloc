import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String src;
  final Color color;
  final double size;

  const SvgIcon({
    Key? key,
    required this.src,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      src,
      color: color,
      height: size,
    );
  }
}
