import 'package:flutter/material.dart';

class MovieNameWidget extends StatelessWidget {
  const MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: 'Без жалости',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        TextSpan(
          text: ' (2021)',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ]),
    );
  }
}
