import 'package:flutter/foundation.dart';
import 'package:serious/locator.dart';
import 'package:serious/models/todo_db.dart';

class TodoDbService {
  AppDb db = locator.get<AppDb>();

  Future<List<TodoData>> getTodoList() async {
    try {
      return await db.select(db.todo).get();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<TodoData> getTodo(int id) async {
    return await (db.select(db.todo)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<int> insertTodo(TodoCompanion entity) async {
    return await db.into(db.todo).insert(entity).then((value) {
      debugPrint('Customer inserted into table');
      return value;
    });
  }

  Future<bool> updateTodo(TodoCompanion entity) async {
    return await db.update(db.todo).replace(entity);
  }

  Future<int> deleteTodo(int id) async {
    return await (db.delete(db.todo)..where((tbl) => tbl.id.equals(id))).go();
  }
}
