import 'package:flutter/foundation.dart';
import 'package:serious/models/todo_db.dart';
import '../services/todo_db_service.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoData> _list = [];
  List<TodoData> get list => _list;

  TodoProvider() {
    refreshTodoItems();
  }

  Future<void> refreshTodoItems() async {
    final data = await TodoDbService().getTodoList();
    _list = data;
    notifyListeners();
  }

  void addTodo(TodoCompanion entity) {
    TodoDbService().insertTodo(entity);
    refreshTodoItems();
    notifyListeners();
  }

  void updateTodo(TodoCompanion todoData) {
    TodoDbService().updateTodo(todoData);
    refreshTodoItems();
    notifyListeners();
  }

  void removeTodo(int id) {
    TodoDbService().deleteTodo(id);
    refreshTodoItems();
    notifyListeners();
  }
}
