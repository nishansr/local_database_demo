import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serious/providers/todo_provider.dart';
import 'package:serious/screens/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) {
          Provider.of<TodoProvider>(_, listen: false).refreshTodoItems();
          return const HomePage();
        });
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error Route'), centerTitle: true),
        body: const Center(child: Text('Sorry no route found!')),
      );
    });
  }
}
