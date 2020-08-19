import 'package:flutter/material.dart';
import 'package:iotappagriculture/screen/portfolio_screen.dart';
import 'package:iotappagriculture/screen/schedule_screen.dart';
import 'package:iotappagriculture/screen/setting_screen.dart';
import 'package:iotappagriculture/screen/status_screen.dart';
import 'package:iotappagriculture/screen/watchlist_screen.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    WatchlistScreen(),
    StatusScreen(),
    ScheduleScreen(),
    PortfolioScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              title: Text('Watchlist'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.device_hub),
              title: Text('Status'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              title: Text('Schedule'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_comment),
              title: Text('Portfolio'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Settings'),
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
