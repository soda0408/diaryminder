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
        title: Text(
          'Diaryminder',
          style: TextStyle(color: Colors.white, fontFamily: 'JockeyOne'),
        ),
      ),
      backgroundColor: AppColor.brand.accent,
      body: Center(child: Text("ホーム画面")),
    );
  }
}
