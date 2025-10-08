import 'package:flutter/material.dart';

// Todo item model
class TodoItem {
  String id;
  String title;
  bool isCompleted;

  TodoItem({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}

// TodoProvider with CRUD operations
class TodoProvider extends ChangeNotifier {
  final List<TodoItem> _todos = [];

  List<TodoItem> get todos => _todos;

  int get count => _todos.length;

  int get completedCount => _todos.where((todo) => todo.isCompleted).length;

  // Add a new todo
  void addTodo(String title) {
    if (title.trim().isEmpty) return;
    
    final newTodo = TodoItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title.trim(),
    );
    _todos.add(newTodo);
    notifyListeners();
  }

  // Toggle todo completion status
  void toggleTodo(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].isCompleted = !_todos[index].isCompleted;
      notifyListeners();
    }
  }

  // Update todo title
  void updateTodo(String id, String newTitle) {
    if (newTitle.trim().isEmpty) return;
    
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].title = newTitle.trim();
      notifyListeners();
    }
  }

  // Remove a todo
  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  // Clear all completed todos
  void clearCompleted() {
    _todos.removeWhere((todo) => todo.isCompleted);
    notifyListeners();
  }

  // Clear all todos
  void clearAll() {
    _todos.clear();
    notifyListeners();
  }
}
