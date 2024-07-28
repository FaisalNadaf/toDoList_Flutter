import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:todolist_flutter/models/task.dart';

class HomePage extends StatefulWidget {
  HomePage();
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  String? _newTaskContext;

  late double _deviceHeight, _deviceWidth;
  Box? _box;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 23, 214, 252),
        toolbarHeight: _deviceHeight * 0.12,
        title: const Text(
          'Taskly',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: _ListView(),
      floatingActionButton: _Addtask(),
    );
  }

  Widget _ListView() {
    return FutureBuilder(
      future: Hive.openBox("tasks"),
      builder: (
        BuildContext _context,
        AsyncSnapshot _snapShot,
      ) {
        if (_snapShot.connectionState == ConnectionState.done) {
          _box = _snapShot.data;
          return _ToDoList();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _ToDoList() {
    // Task _newTask = Task(
    //   content: 'sleeep',
    //   timeStramp: DateTime.now(),
    //   isDone: true,
    // );
    // _box?.add(_newTask.toMap());
    List tasks = _box!.values.toList();

    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (
          BuildContext _context,
          int _index,
        ) {
          var task = Task.fromMap(tasks[_index]);
          return ListTile(
            title: Text(
              task.content,
              style: TextStyle(
                fontSize: 25,
                decoration: task.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(
              task.timeStramp.toString(),
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(
              task.isDone
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank,
              color: Color.fromARGB(255, 23, 214, 252),
              size: 30,
            ),
          );
        });
  }

  Widget _Addtask() {
    return FloatingActionButton(
      onPressed: _displayTaskPopup,
      backgroundColor: const Color.fromARGB(255, 23, 214, 252),
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }

  void _displayTaskPopup() {
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          title: const Text(
            'Add Task',
          ),
          content: TextField(
            onSubmitted: (_value) {
              if (_newTaskContext != null) {
                Task _newTask = Task(
                  content: _newTaskContext!,
                  timeStramp: DateTime.now(),
                  isDone: false,
                );
                _box?.add(_newTask.toMap());
              }
              setState(() {
                _newTaskContext = null;
                Navigator.pop(context);
              });
            },
            onChanged: (_value) {
              setState(() {
                _newTaskContext = _value;
              });
            },
          ),
        );
      },
    );
  }
}
