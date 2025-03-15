import 'package:flutter/material.dart';
import 'package:diaryminder/constant/app_color.dart'; // AppColorのインポート
import 'package:diaryminder/screens/main_page.dart'; // MainPageのインポート
import 'package:timezone/data/latest.dart' as tz; // タイムゾーンデータのインポート

void main() {
  tz.initializeTimeZones(); // タイムゾーンの初期化
  runApp(const Diaryminder());
}

class Diaryminder extends StatelessWidget {
  const Diaryminder({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
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
