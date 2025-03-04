import 'package:flutter/material.dart';
import 'constant/app_color.dart';
import 'package:diaryminder/screens/home_screen.dart';

void main() {
  runApp(const Diaryminder());
}

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

class Diaryminder extends StatelessWidget {
  const Diaryminder({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorSchemeSeed: AppColor.brand.secondary),
      home: const TitlePage(title: 'Diaryminder'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TitlePage extends StatefulWidget {
  const TitlePage({super.key, required this.title});

  final String title;

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
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
              MaterialPageRoute(builder: (context) => HomePage()),
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
