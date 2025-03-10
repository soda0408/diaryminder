import 'package:flutter/material.dart';
import 'package:diaryminder/constant/app_color.dart';
import 'package:diaryminder/widgets/app_bar.dart';
import 'package:diaryminder/screens/home_screen.dart';
import 'package:diaryminder/screens/calender_screen.dart';
import 'package:diaryminder/screens/scan_screen.dart';
import 'package:diaryminder/screens/today_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'home'),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_view_day_rounded),
      label: 'today',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today_rounded),
      label: 'calender',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt_outlined),
      label: 'scan',
    ),
  ];
  final screens = <Widget>[
    HomeScreen(),
    TodayScreen(),
    CalenderScreen(),
    ScanScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DiaryminderAppBar,
      backgroundColor: AppColor.ui.background,
      body: Stack(
        children: <Widget>[
          IndexedStack(index: _currentIndex, children: screens),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.ui.primary,
        unselectedItemColor: AppColor.ui.gray,
        currentIndex: _currentIndex,
        onTap:
            (selectedIndex) => setState(() {
              _currentIndex = selectedIndex;
            }),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.brand.secondary,
        items: items,
      ),
    );
  }
}
