import 'package:dodiddone/theme/theme.dart';
import 'package:dodiddone/widgets/task_item.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final List<String> _tasks = ['Task 1', 'Task 2', 'Task 3'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return TaskItem(
            title: _tasks[index],
            description: _tasks[index],
            deadline: DateTime.now(), 
            urgency: TaskUrgency.urgent,
          );
        },
      );
  }
}
