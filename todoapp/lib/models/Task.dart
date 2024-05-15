class Task {
  String title;
  String description;
  DateTime date;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.date,
    this.isCompleted = false,
  });
}
