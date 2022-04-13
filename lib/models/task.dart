
import 'package:flutter/cupertino.dart';

class Task {
  Task({required this.name, required this.color, this.task_Done = false});
  
  final String ?name;
  bool task_Done=false;
  Color ?color;

  void taskDone() {
    task_Done = !task_Done;
  }
}