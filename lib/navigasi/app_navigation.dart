import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:suplis_app/navigasi/theme_provider.dart';
import 'package:suplis_app/pages/list_data_petugas.dart';
import 'package:suplis_app/pages/list_notifikasi.dart';
import 'package:suplis_app/pages/profile_petugas.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Import CurvedNavigationBar

class AppNavigation extends StatefulWidget {
  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ListDataPetugas(),
    ListNotifikasi(),
    ProfilePetugas(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider =
        Provider.of<ThemeProvider>(context); // Use lowercase 'themeProvider'
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 70.0,
        items: <Widget>[
          Icon(Icons.list, size: 30, color: Colors.white),
          Icon(Icons.notifications, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.blue, // Set the background color to blue
        buttonBackgroundColor: Colors.blue, // Set the button color to blue
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 800),
        onTap: _onItemTapped,
        letIndexChange: (index) => true,
      ),
    );
  }
}
