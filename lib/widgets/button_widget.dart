import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.borderRadius = 10,
  });

  final String title;
  final void Function() onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(title),
    );
  }
}
