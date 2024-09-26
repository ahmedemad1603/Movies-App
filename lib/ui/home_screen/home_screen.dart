import 'package:flutter/material.dart';
import 'package:movies_app/ui/home_screen/tabs/Browse/browse_tab.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/home_tab.dart';
import 'package:movies_app/ui/home_screen/tabs/Search/search_tab.dart';
import 'package:movies_app/ui/home_screen/tabs/Watchlist/watchlist_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const WatchlistTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).canvasColor,
            icon: const Icon(Icons.home),
            label: "HOME"
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).canvasColor,
            icon: const Icon(Icons.search),
            label: "SEARCH"
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).canvasColor,
            icon: const Icon(Icons.movie),
            label: "BROWSE"
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).canvasColor,
            icon: const Icon(Icons.book),
            label: "WATCHLIST"
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
