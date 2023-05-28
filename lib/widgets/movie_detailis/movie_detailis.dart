import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:themoviedb/widgets/movie_detailis/movie_cast_widget.dart';
import 'package:themoviedb/widgets/movie_detailis/movie_info_widget.dart';

class MovieDetailis extends StatefulWidget {
  final int movieId;
  const MovieDetailis({super.key, required this.movieId});

  @override
  State<MovieDetailis> createState() => _MovieDetailisState();
}

class _MovieDetailisState extends State<MovieDetailis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Какой-то фильм'),
      ),
      body: ColoredBox(
        color: Color.fromRGBO(23, 23, 27, 1.0),
        child: ListView(physics: BouncingScrollPhysics(), children: [
          MovieInfoWidget(),
          SizedBox(height: 30),
          MovieCastWidget(),
        ]),
      ),
    );
  }
}
