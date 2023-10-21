import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serious/models/todo_db.dart';
import 'package:serious/providers/theme_provider.dart';
import 'package:serious/providers/todo_provider.dart';
import 'package:serious/screens/tabs/all_todo.dart';
import 'package:serious/screens/tabs/completed_todo.dart';
import 'package:drift/drift.dart' as d;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _todoProvider = Provider.of<TodoProvider>(context);
    final _themeProvider = Provider.of<ThemeProvider>(context);
    TextEditingController _todoController = TextEditingController();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                _themeProvider.isDark
                    ? _themeProvider.isDark = false
                    : _themeProvider.isDark = true;
              },
              icon: _themeProvider.isDark
                  ? const Icon(Icons.light_mode_sharp)
                  : const Icon(Icons.dark_mode_sharp),
            )
          ],
          bottom: const TabBar(tabs: [
            Tab(text: 'All'),
            Tab(text: 'Completed'),
          ]),
        ),
        body: const TabBarView(
          children: [
            AllTodoPage(),
            CompletedTodoPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Enter todo'),
                    content: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(labelText: 'Todo'),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          _todoProvider.addTodo(TodoCompanion(
                            dateAdded: d.Value(DateTime.now()),
                            todo: d.Value(_todoController.text),
                            isCompleted: const d.Value(false),
                          ));
                          Navigator.pop(context);
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
