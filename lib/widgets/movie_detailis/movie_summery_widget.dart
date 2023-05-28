import 'package:flutter/material.dart';

class MovieSummeryWidget extends StatelessWidget {
  const MovieSummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        child: Text(
          'R, 04/29/2021 (US) 1h49m Боевик, Драма, Преступление',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
