import 'package:courses_app/components/featurescreen/courses_screen.dart';
import 'package:courses_app/components/featurescreen/home_screen.dart';
import 'package:courses_app/components/featurescreen/mycourse_screen.dart';
import 'package:courses_app/components/featurescreen/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // List of widgets to display for each tab
  final List<Widget> _screens = [
    const HomeScreen(),
    const CoursesScreen(),
    const MyCoursesScreen(),
    const ProfileScreen(),
  ];

  // Function to handle tab selection
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blueAccent, // Color for the selected icon and label
        unselectedItemColor: Colors.grey[600], // Color for unselected icons and labels
        backgroundColor: Colors.white, // Background color of the bottom navigation
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold), // Bold text for selected label
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal), // Normal text for unselected label
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
