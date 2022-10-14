import 'package:flutter/material.dart';
import 'package:marketdo/screens/views/home_product.dart';
import 'package:marketdo/screens/views/home_profile.dart';
import 'package:marketdo/screens/views/home_settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [HomeProduct(), HomeProfile(), const HomeSettings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(child: tabs[_currentIndex]),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.shifting,
              iconSize: 25,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: 'Home',
                  backgroundColor: Colors.lightBlue[400],
                ),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.lightGreen[400],
                    label: 'Profile'),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.brown[400],
                    label: 'Settings'),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
