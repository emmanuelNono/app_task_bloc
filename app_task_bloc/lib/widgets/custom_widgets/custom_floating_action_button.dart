import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backColor;
  final String? tooltip;
  final Icon icon;

  const CustomFloatingActionButton({
    Key? key,
    required this.onPressed,
    this.backColor, //oprtional
    this.tooltip, //oprtional
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: onPressed,
        tooltip: tooltip,
        backgroundColor: backColor ??
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: icon,
      );
}
