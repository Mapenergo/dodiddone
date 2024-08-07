import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final DateTime deadline;

  const TaskItem({
    Key? key,
    required this.title,
    required this.description,
    required this.deadline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format the deadline using intl
    final formattedDeadline = DateFormat('dd.MM.yy HH:mm').format(deadline);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              'Deadline: $formattedDeadline', // Use the formatted deadline
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
