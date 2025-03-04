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
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop,
          icon: Icon(
            Icons.menu_rounded,
            color: AppColor.brand.primary,
            size: 35,
          ),
        ),
        title: Text(
          'Diaryminder',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'JockeyOne',
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop,
            icon: Icon(
              Icons.notifications_none_rounded,
              color: AppColor.brand.primary,
              size: 35,
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
      backgroundColor: AppColor.brand.accent,
      body: Center(child: Text("ホーム画面")),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.brand.secondary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_view_day_rounded,
              color: AppColor.brand.primary,
              size: 35,
            ),
            label: 'today',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: AppColor.brand.primary,
              size: 35,
            ),
            label: 'camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_rounded,
              color: AppColor.brand.primary,
              size: 35,
            ),
            label: 'calender',
          ),
        ],
      ),
    );
  }
}
