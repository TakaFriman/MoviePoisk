import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(
      Colors.black,
    ),
    textStyle: MaterialStateProperty.all(
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    ),
  );
}
