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

enum Context {
  Home,
  Office,
  Someday,
}

class TaskListItem {
  final String id;
  final String title;
  final String? notes;
  final DateTime dueDate;
  final DateTime? startDate;
  final DateTime? time;
  final DateTime? reminder;
  final Importance? importance;
  final Urgency? urgency;
  final bool isStarred;
  final Context? context;
  final bool? isFolder;
  final bool? isProject;

  TaskListItem({
    required this.id,
    required this.title,
    this.notes,
    required this.dueDate,
    this.startDate,
    this.time,
    this.reminder,
    this.importance,
    this.urgency,
    this.isStarred = false,
    this.context,
    this.isFolder = false,
    this.isProject = false,
  });
}
