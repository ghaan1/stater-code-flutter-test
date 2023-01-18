import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/Home/home_page.dart';

import 'Navbar/List/list_page.dart';
import 'Navbar/Profile/profile_page.dart';

class LandingHome extends StatefulWidget {
  const LandingHome({super.key});
  @override
  State<LandingHome> createState() => _LandingHomeState();
}

class _LandingHomeState extends State<LandingHome> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          NavigationDestination(
            icon: Icon(Icons.accessibility),
            label: 'Profil',
          ),
        ],
      ),
      body: <Widget>[
        const HomePage(),
        const MainList(),
        const MainProfil(),
      ][currentPageIndex],
    );
  }
}
