class ToDo {
  String title;
  String description;
  DateTime date;
  bool isCompleted;

  ToDo({
    required this.title,
    required this.description,
    required this.date,
    this.isCompleted = false,
  });
}
