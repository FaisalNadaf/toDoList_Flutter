import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage();
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  _HomePage();

  String? _newTaskContext;

  late double _deviceHeight, _deviceWidth;
  @override
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
      body: _ToDoList(),
      floatingActionButton: _Addtask(),
    );
  }

  Widget _ToDoList() {
    return ListView(
      children: [
        ListTile(
          title: const Text(
            'do londry',
            style: TextStyle(
              fontSize: 25,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          subtitle: Text(
            DateTime.now().toString(),
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: const Icon(
            Icons.check_box_outlined,
            color: Color.fromARGB(255, 23, 214, 252),
            size: 30,
          ),
        ),
      ],
    );
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
            onSubmitted: (_value) {},
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
