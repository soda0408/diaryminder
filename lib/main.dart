import 'package:flutter/material.dart';
import 'package:diaryminder/constant/app_color.dart'; // AppColorのインポート
import 'package:diaryminder/screens/main_page.dart'; // MainPageのインポート
import 'package:timezone/data/latest.dart' as tz; // タイムゾーンデータのインポート
import 'package:diaryminder/widgets/app_bar.dart';
import 'package:diaryminder/screens/home_screen.dart';
import 'package:diaryminder/screens/calender_screen.dart';
import 'package:diaryminder/screens/scan_screen.dart';
import 'package:diaryminder/screens/today_screen.dart';

void main() {
  tz.initializeTimeZones(); // タイムゾーンの初期化
  runApp(const Diaryminder());
}

class Diaryminder extends StatelessWidget {
  const Diaryminder({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diaryminder',
      theme: ThemeData(colorSchemeSeed: AppColor.brand.secondary),
      home: const TitlePage(title: 'Diaryminder'), // 最初に表示する画面をTitlePageに設定
      debugShowCheckedModeBanner: false,
    );
  }
}

class TitlePage extends StatefulWidget {
  const TitlePage({super.key, required this.title});

  final String title;

  @override
  State<TitlePage> createState() => TitlePageState();
}

class TitlePageState extends State<TitlePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0XFFAEFAFA), AppColor.brand.secondary],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(selectedIndex: 0),
              ),
            );
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Diaryminder',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'JockeyOne',
                    fontSize: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Today\'s Screen')),
      body: const Center(child: Text('Welcome to Today\'s Screen!')),
    );
  }
}

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
    ToDoListPage(), // Ensure this import is correct
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
    BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ToDo List'),
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
