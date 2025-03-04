import 'package:flutter/material.dart';
import 'package:diaryminder/constant/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.brand.secondary,
        centerTitle: true,
        title: Text(
          'Diaryminder',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'JockeyOne',
            fontSize: 30,
          ),
        ),
      ),
      backgroundColor: AppColor.brand.accent,
      body: Center(child: Text("ホーム画面")),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
            tooltip: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'camera',
            tooltip: 'camera',
          ),
        ],
      ),
    );
  }
}
