import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/widgets/auth/auth_widget.dart';
import 'package:themoviedb/widgets/bar_page.dart';
import 'package:themoviedb/widgets/home/home_page.dart';
import 'package:themoviedb/widgets/movie_detailis/movie_detailis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
        ),
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/auth': (context) => AuthWidget(),
        '/home_page': (context) => HomePage(),
        '/bar_page': (context) => BarPage(),
        '/home_page/movie_detailis_page': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailis(
              movieId: arguments,
            );
          } else {
            return MovieDetailis(
              movieId: 0,
            );
          }
        }
      },
      initialRoute: '/auth',
    );
  }
}
