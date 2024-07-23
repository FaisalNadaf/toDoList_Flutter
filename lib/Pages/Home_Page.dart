import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  _HomePage();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'faisal',
        style: TextStyle(
          color: Colors.red,
          fontSize: 60,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
