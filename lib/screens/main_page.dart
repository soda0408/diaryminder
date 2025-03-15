import 'package:flutter/material.dart';
import 'package:diaryminder/constant/app_color.dart';
import 'package:diaryminder/widgets/app_bar.dart';
import 'package:diaryminder/screens/home_screen.dart';
import 'package:diaryminder/screens/calender_screen.dart';
import 'package:diaryminder/screens/scan_screen.dart';
import 'package:diaryminder/screens/today_screen.dart'; // Ensure this import is correct

class MainPage extends StatefulWidget {
  final int selectedIndex;
  const MainPage({super.key, this.selectedIndex = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _currentIndex;
  final List<Widget> _screens = [
    HomeScreen(),
    CalenderScreen(),
    ScanScreen(),
    ToDoListPage(), // 修正: ToDoListPageを追加
  ];

  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'home'),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today_rounded),
      label: 'calender',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt_outlined),
      label: 'scan',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: 'ToDo List',
    ), // 修正: アイコンとラベルを変更
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DiaryminderAppBar,
      backgroundColor: AppColor.ui.background,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.ui.primary,
        unselectedItemColor: AppColor.ui.gray,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.brand.secondary,
        items: items,
      ),
    );
  }
}
