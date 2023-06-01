import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/widgets/auth/auth_widget.dart';
import 'package:themoviedb/widgets/auth/auth_widget_model.dart';

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
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainColor,
          selectedItemColor: Color.fromRGBO(230, 218, 166, 1),
          unselectedItemColor: Color.fromRGBO(230, 218, 166, 0.45),
        ),
      ),
      routes: {
        '/auth': (context) => AuthProvider(
              model: AuthModel(),
              child: const AuthWidget(),
            ),
        '/home_page': (context) => const HomePage(),
        '/bar_page': (context) => const BarPage(),
        '/home_page/movie_detailis_page': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailis(movieId: arguments);
          } else {
            return const MovieDetailis(movieId: 0);
          }
        }
      },
      initialRoute: '/auth',
    );
  }
}
