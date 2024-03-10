// ignore_for_file: public_member_api_docs, sort_constructors_first

class Todo {
  final String name;
  final DateTime createdAt;
  final int todoId;
  Todo({
    required this.name,
    required this.createdAt,
    required this.todoId,
  });

  @override
  String toString() => 'Todo(name: $name, createdAt: $createdAt ,todoId: $todoId)';
}
