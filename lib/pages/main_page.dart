import '../screens/profile.dart'; // Import ProfilePage
import '../theme/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Use a list of widgets directly
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Tasks'), // Replace with actual route for Tasks screen
    Text('Today'), // Replace with actual route for Today screen
    ProfilePage(), // Route for ProfilePage
    Text('Done'), // Replace with actual route for Done screen
  ];

  void _onItemTapped(int index) {
    // Navigate to the corresponding widget
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = DoDidDoneTheme.lightTheme.colorScheme.primary;
    final secondaryColor = DoDidDoneTheme.lightTheme.colorScheme.secondary;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [secondaryColor, primaryColor],
            stops: const [0.1, 0.9],
          ),
        ),
        // Use a placeholder widget for now
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Done',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: secondaryColor,
        unselectedItemColor: primaryColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
