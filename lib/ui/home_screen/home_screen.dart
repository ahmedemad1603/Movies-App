import 'package:flutter/material.dart';
import 'package:movies_app/ui/home_screen/tabs/browse_tab.dart';
import 'package:movies_app/ui/home_screen/tabs/home_tab.dart';
import 'package:movies_app/ui/home_screen/tabs/search_tab.dart';
import 'package:movies_app/ui/home_screen/tabs/watchlist_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchlistTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            icon: Icon(Icons.home),
            label: "HOME"
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            icon: Icon(Icons.search),
            label: "SEARCH"
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            icon: Icon(Icons.movie),
            label: "BROWSE"
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            icon: Icon(Icons.book),
            label: "WATCHLIST"
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
