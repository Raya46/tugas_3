import 'package:flutter/material.dart';
import 'package:learning_1/belajarAppbar.dart';
import 'package:learning_1/homePage.dart';
import 'package:learning_1/profilePage.dart';

class SimpleBottomNavigation extends StatefulWidget {
  final String username;
  const SimpleBottomNavigation({Key? key, required this.username})
      : super(key: key);

  @override
  State<SimpleBottomNavigation> createState() => _SimpleBottomNavigationState();
}

class _SimpleBottomNavigationState extends State<SimpleBottomNavigation> {
  int _selectedIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late List<Widget> _children; // Declare but don't initialize yet

  @override
  void initState() {
    super.initState();
    _children = [
      const BelajarAppBar(),
      const UjianOnlineBeranda(),
      ProfilePage1(
        username: widget.username,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color(0xff757575),
          type: BottomNavigationBarType.shifting,
          onTap: onTabTapped,
          items: _navBarItems),
    );
  }
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.bookmark_border_outlined),
    activeIcon: Icon(Icons.bookmark_rounded),
    label: 'Bookmarks',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    activeIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
];
