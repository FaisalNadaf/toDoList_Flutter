import 'package:flutter/foundation.dart';

class Task {
  String content;
  DateTime timeStramp;
  bool isDone;

  Task({
    required this.content,
    required this.timeStramp,
    required this.isDone,
  });

  factory Task.fromMap(Map task) {
    return Task(
      content: task["content"],
      timeStramp: task["timeStramp"],
      isDone: task["isDone"],
    );
  }

  Map toMap() {
    return {
      "content": content,
      "timeStramp": timeStramp,
      "isDone": isDone,
    };
  }
}
