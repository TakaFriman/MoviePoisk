import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:themoviedb/widgets/images.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie(
      {required this.id,
      required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id: 1,
        imageName: AppImages.girlImg,
        title: 'Смертельная битва',
        time: 'April 7, 2021',
        description: 'Битва за жизнь !!!!'),
    Movie(
        id: 2,
        imageName: AppImages.girlImg,
        title: 'Семь жизней',
        time: 'April 7, 2021',
        description: 'Битва за жизнь !!!!'),
    Movie(
        id: 3,
        imageName: AppImages.girlImg,
        title: 'Прибытие',
        time: 'April 7, 2021',
        description: 'Битва за жизнь !!!!'),
    Movie(
        id: 4,
        imageName: AppImages.girlImg,
        title: 'Интерстеллар',
        time: 'April 7, 2021',
        description: 'Битва за жизнь !!!!'),
    Movie(
        id: 5,
        imageName: AppImages.girlImg,
        title: 'Дюна',
        time: 'April 7, 2021',
        description: 'Битва за жизнь !!!!'),
  ];
  var _filterMovies = <Movie>[];
  final _searchController = TextEditingController();
  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filterMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filterMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filterMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      '/home_page/movie_detailis_page',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 70),
            itemCount: _filterMovies.length,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: BouncingScrollPhysics(),
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filterMovies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  movie.time,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  movie.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _onMovieTap(index),
                      ),
                    ),
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                labelText: 'Поиск',
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                border: OutlineInputBorder()),
          ),
        )
      ],
    );
  }
}
