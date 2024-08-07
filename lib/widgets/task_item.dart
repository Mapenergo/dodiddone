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
    required this.deadline, required TaskUrgency urgency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format the deadline using intl
    final formattedDeadline = DateFormat('dd.MM.yy HH:mm').format(deadline);

    // Calculate days left
    final daysLeft = deadline.difference(DateTime.now()).inDays;

    // Determine urgency based on days left
    TaskUrgency urgency;
    if (daysLeft <= 1) {
      urgency = TaskUrgency.urgent;
    } else if (daysLeft <= 2) {
      urgency = TaskUrgency.notVeryUrgent;
    } else {
      urgency = TaskUrgency.nonUrgent;
    }

    // Define gradient based on urgency
    Gradient gradient;
    switch (urgency) {
      case TaskUrgency.urgent:
        gradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.red, Colors.white],
        );
        break;
      case TaskUrgency.notVeryUrgent:
        gradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.yellow, Colors.white],
        );
        break;
      case TaskUrgency.nonUrgent:
        gradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.green, Colors.white],
        );
        break;
    }

    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Wrap title in Container and apply gradient
          Container(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              ), // Add rounded corners
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Set text color to black for contrast
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  'Deadline: $formattedDeadline', // Use the formatted deadline
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          // Add two icon buttons: Edit and Delete
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    // Handle Edit action
                    print('Edit button pressed');
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    // Handle Delete action
                    print('Delete button pressed');
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Enum for task urgency
enum TaskUrgency { urgent, notVeryUrgent, nonUrgent }
