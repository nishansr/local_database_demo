import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serious/models/todo_db.dart';
import 'package:serious/providers/todo_provider.dart';
import 'package:drift/drift.dart' as d;
import 'package:intl/intl.dart';

class AllTodoPage extends StatelessWidget {
  const AllTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _todoController = TextEditingController();
    final todoProvider = Provider.of<TodoProvider>(context);
    return ListView.builder(
        itemCount: todoProvider.list.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Enter todo'),
                          content: TextField(
                            controller: _todoController,
                            decoration:
                                const InputDecoration(labelText: 'Todo'),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                todoProvider.updateTodo(
                                  TodoCompanion(
                                    id: d.Value(todoProvider.list[index].id),
                                    dateAdded: d.Value(DateTime.now()),
                                    todo: d.Value(_todoController.text),
                                    isCompleted: d.Value(
                                        todoProvider.list[index].isCompleted),
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              child: const Text('Update'),
                            ),
                          ],
                        );
                      });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                tileColor: Color.fromARGB(255, 163, 163, 163),
                leading: Checkbox(
                  value: todoProvider.list[index].isCompleted,
                  onChanged: (value) {
                    todoProvider.updateTodo(TodoCompanion(
                      id: d.Value(todoProvider.list[index].id),
                      todo: d.Value(todoProvider.list[index].todo),
                      dateAdded: d.Value(todoProvider.list[index].dateAdded),
                      isCompleted:
                          d.Value(!todoProvider.list[index].isCompleted),
                    ));
                  },
                ),
                title: Text(
                  todoProvider.list[index].todo,
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                    DateFormat('dd/MM/yyyy')
                        .format(todoProvider.list[index].dateAdded),
                    style: TextStyle(color: Colors.black)),
                trailing: Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    iconSize: 18,
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      todoProvider.removeTodo(todoProvider.list[index].id);
                    },
                  ),
                )),
          );
        }));
  }
}
