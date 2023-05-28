import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:themoviedb/widgets/bar_page.dart';
import 'package:themoviedb/widgets/images.dart';
import 'package:themoviedb/widgets/movie_detailis/movie_name_widget.dart';
import 'package:themoviedb/widgets/movie_detailis/people_widgets.dart';
import 'package:themoviedb/widgets/movie_detailis/top_poster_widget.dart';

import 'description_widget.dart';
import 'movie_summery_widget.dart';

class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TopPosterWidget(),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: MovieNameWidget(),
      ),
      MovieScoreWidget(),
      MovieSummeryWidget(),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: _OverviewWidget(),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: DescriptionWidget(),
      ),
      SizedBox(height: 30),
      PeopleWidgets(),
    ]);
  }
}

Text _OverviewWidget() {
  return Text(
    'Overview',
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
}

class MovieScoreWidget extends StatelessWidget {
  const MovieScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: RadialPercentWidget(
                  fillColor: Color.fromARGB(255, 10, 23, 25),
                  freeColor: Color.fromARGB(255, 25, 54, 31),
                  lineColor: Color.fromARGB(255, 37, 203, 103),
                  lineWidth: 3,
                  percent: 0.72,
                  child: Text('72'),
                ),
              ),
              SizedBox(width: 10),
              Text(
                'User Score',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 1,
          height: 15,
          color: Colors.grey,
        ),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          label: Text(
            'Play Trailer',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
