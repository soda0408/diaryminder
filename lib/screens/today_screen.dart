import 'package:flutter/material.dart';
import 'package:diaryminder/constant/app_color.dart'; // AppColorのインポート
import 'package:diaryminder/screens/today_screen.dart'; // TodayScreenのインポート
import 'package:diaryminder/screens/main_page.dart'; // MainPageのインポート
import 'package:diaryminder/widgets/app_bar.dart'; // AppBarのインポート
import 'package:flutter_local_notifications/flutter_local_notifications.dart'; // 通知パッケージのインポート
import 'package:intl/intl.dart'; // 日付フォーマットのインポート
import 'package:timezone/data/latest.dart' as tz; // タイムゾーンデータのインポート
import 'package:timezone/timezone.dart' as tz; // タイムゾーンのインポート

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
      home: const ToDoListPage(), // 最初に表示する画面をToDoListPageに設定
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});
  @override
  ToDoListPageState createState() => ToDoListPageState();
}

class ToDoListPageState extends State<ToDoListPage> {
  final List<Map<String, dynamic>> _toDoItems = [];
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  void _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _addToDoItem(
    String task,
    DateTime dateTime,
    Duration notificationDuration,
  ) {
    if (task.isNotEmpty) {
      setState(() {
        _toDoItems.add({
          'task': task,
          'dateTime': dateTime,
          'notificationDuration': notificationDuration,
        });
      });
      _scheduleNotification(task, dateTime, notificationDuration);
    }
  }

  void _scheduleNotification(
    String task,
    DateTime dateTime,
    Duration notificationDuration,
  ) async {
    final scheduledNotificationDateTime = dateTime.subtract(
      notificationDuration,
    );
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'your_channel_id',
          'your_channel_name',
          channelDescription: 'your_channel_description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'ToDo Reminder',
      task,
      tz.TZDateTime.from(scheduledNotificationDateTime, tz.local),
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exact, // 必須パラメータを追加
    );
  }

  void _removeToDoItem(int index) {
    setState(() {
      _toDoItems.removeAt(index);
    });
  }

  Widget _buildToDoItem(Map<String, dynamic> item, int index) {
    return ListTile(
      title: Text(item['task']),
      subtitle: Text(DateFormat('yyyy-MM-dd HH:mm').format(item['dateTime'])),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          _removeToDoItem(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DiaryminderAppBar, // AppBarを追加
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.ui.primary, AppColor.ui.secondary],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: ListView.builder(
          itemCount: _toDoItems.length,
          itemBuilder: (context, index) {
            return _buildToDoItem(_toDoItems[index], index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayAddToDoDialog(context),
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.ui.primary,
        unselectedItemColor: AppColor.ui.gray,
        currentIndex: 1, // ToDoListPageのインデックスを設定
        onTap: (selectedIndex) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(selectedIndex: selectedIndex),
            ),
          );
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.brand.secondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ToDo List'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: 'calender',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'scan',
          ),
        ],
      ),
    );
  }

  Future<void> _displayAddToDoDialog(BuildContext context) async {
    String newTask = '';
    DateTime selectedDateTime = DateTime.now();
    Duration notificationDuration = Duration(minutes: 10);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('タスクを追加する'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newTask = value;
                },
                decoration: InputDecoration(hintText: 'タスクを入力してください'),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: '日時を入力してください (西暦-月-日 時:分)',
                ),
                onChanged: (value) {
                  selectedDateTime = DateFormat(
                    'yyyy-MM-dd HH:mm',
                  ).parse(value);
                },
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: '通知を送る時間を入力してください (分)',
                ),
                onChanged: (value) {
                  notificationDuration = Duration(minutes: int.parse(value));
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('キャンセル'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('追加'),
              onPressed: () {
                _addToDoItem(newTask, selectedDateTime, notificationDuration);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
