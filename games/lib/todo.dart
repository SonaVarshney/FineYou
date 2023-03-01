class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(
        id: '01',
        todoText: 'Exercise regularly',
      ),
      ToDo(
        id: '02',
        todoText: 'Sleep Well',
      ),
      ToDo(
        id: '03',
        todoText: 'Take Regular Breaks',
      ),
      ToDo(
        id: '04',
        todoText: 'Smile a Little',
      ),
    ];
  }
}
