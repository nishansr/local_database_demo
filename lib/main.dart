import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serious/locator.dart';
import 'package:serious/models/todo_db.dart';
import 'package:serious/providers/theme_provider.dart';
import 'package:serious/providers/todo_provider.dart';
import 'package:serious/routes/routes.dart';
import 'package:serious/utils/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => AppDb(),
          dispose: (context, AppDb appDb) => appDb.close(),
        ),
        ChangeNotifierProvider(create: (context) => TodoProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, index) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: value.isDark ? darkTheme : lightTheme,
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
