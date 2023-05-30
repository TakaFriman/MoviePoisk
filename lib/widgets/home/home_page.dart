import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/movie_list/movie_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TMDB'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const Text('Главная'),
          MovieListWidget(),
          const Text('Сериалы'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_outlined),
            label: 'Фильмы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv_outlined),
            label: 'Сериалы',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
