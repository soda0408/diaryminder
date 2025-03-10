import 'package:flutter/material.dart';
import 'package:diaryminder/constant/app_color.dart';

PreferredSizeWidget DiaryminderAppBar = AppBar(
  backgroundColor: AppColor.brand.secondary,
  automaticallyImplyLeading: false,
  centerTitle: true,
  leading: IconButton(
    onPressed: null,
    icon: Icon(Icons.menu_rounded, color: AppColor.brand.primary, size: 35),
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
      onPressed: null,
      icon: Icon(
        Icons.notifications_none_rounded,
        color: AppColor.brand.primary,
        size: 35,
      ),
    ),
    SizedBox(width: 5),
  ],
);
