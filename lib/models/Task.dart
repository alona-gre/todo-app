import 'package:flutter/material.dart';

enum Importance {
  Min,
  Less,
  Normal,
  More,
  Max,
}

enum Urgency {
  Min,
  Less,
  Normal,
  More,
  Max,
}

class Task with ChangeNotifier {
  final String id;
  final String title;
  final bool isSelected;
  final String? notes;
  final DateTime dueDate;
  final DateTime? startDate;
  final DateTime? time;
  final DateTime? reminder;
  final Importance? importance;
  final Urgency? urgency;
  final double timeRequired;
  bool isStarred;
  final String? context;
  final bool? isFolder;
  final bool? isProject;

  Task({
    required this.id,
    required this.title,
    this.isSelected = false,
    this.notes,
    required this.dueDate,
    this.startDate,
    this.time,
    this.reminder,
    this.importance,
    this.urgency,
    this.timeRequired = 0,
    this.isStarred = false,
    this.context = ' ',
    this.isFolder = false,
    this.isProject = false,
  });

  void toggleStar() {
    isStarred = !isStarred;
    notifyListeners();
  }
}
