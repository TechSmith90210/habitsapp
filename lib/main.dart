import 'package:flutter/material.dart';
import 'package:habit_speed_code/pages/habitsPage.dart';
import 'package:habit_speed_code/pages/profilePage.dart';
import 'package:habit_speed_code/pages/progressPage.dart';

import 'pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const NavigationScreen(
        initialIndex: 3,
      ),
    );
  }
}

const List<Widget> screens = [
  HomePage(),
  ProgressPage(),
  Habitspage(),
  ProfilePage()
];

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({required this.initialIndex});

  final int initialIndex;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: Colors.blueGrey[900],
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Progress",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: "Habits",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
