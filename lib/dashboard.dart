import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/favorite.dart';
import 'package:weatherapp/homepage.dart';
import 'package:weatherapp/profile.dart';
import 'package:weatherapp/search.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  List screens = const [HomePage(), Favorite(), Search(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedTab.index],
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Column(
              children: [
                BoxedIcon(WeatherIcons.day_cloudy, size: 10),
                Text(
                  'Weather',
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 10,
                ),
                Text('Location',
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold))
              ],
            ),
          ),

          /// Search
          DotNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  Icons.newspaper_outlined,
                ),
                Text(
                  'NewsPaper',
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.person),
                Text('Preference',
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, profile }
