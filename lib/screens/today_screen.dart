import 'package:flutter/material.dart';
import 'package:diaryminder/constant/app_color.dart'; // AppColorのインポート
import 'package:diaryminder/screens/main_page.dart'; // MainPageのインポート
import 'package:diaryminder/widgets/app_bar.dart'; // AppBarのインポート

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DiaryminderAppBar, // AppBarを追加
      body: Center(child: Text("today")),
    );
  }
}

void main() {
  runApp(const Diaryminder());
}

class Diaryminder extends StatelessWidget {
  const Diaryminder({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorSchemeSeed: AppColor.brand.secondary),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToDoListPage extends StatefulWidget {
  @override
  ToDoListPageState createState() => ToDoListPageState();
}

class ToDoListPageState extends State<ToDoListPage> {
  final List<String> _toDoItems = [];

  void _addToDoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _toDoItems.add(task);
      });
    }
  }

  void _removeToDoItem(int index) {
    setState(() {
      _toDoItems.removeAt(index);
    });
  }

  Widget _buildToDoItem(String task, int index) {
    return ListTile(
      title: Text(task),
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
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a new task'),
          content: TextField(
            onChanged: (value) {
              newTask = value;
            },
            decoration: InputDecoration(hintText: 'Enter task here'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                _addToDoItem(newTask);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
