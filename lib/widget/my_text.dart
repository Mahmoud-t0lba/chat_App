import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize, letterSpace, wordSpace;
  final String? fontFamily;
  final TextAlign? alien;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final EdgeInsets? margin;

  const MyText({
    super.key,
    required this.title,
    this.fontSize,
    this.color,
    this.style,
    this.alien,
    this.fontFamily,
    this.decoration,
    this.letterSpace,
    this.wordSpace,
    this.overflow,
    this.fontWeight,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(0),
      child: Text(
        title,
        textAlign: alien ?? TextAlign.start,
        overflow: overflow,
        style: style ??
            TextStyle(
              color: color ?? Colors.black,
              fontSize: fontSize ?? 16,
              decoration: decoration ?? TextDecoration.none,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
            ),
      ),
    );
  }
}
