import 'package:flutter/material.dart';
import 'package:todo_list/src/views/home_view.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        appBarTheme: const AppBarTheme(color: Colors.red),
      ),
      home: const HomeView(),
    );
  }
}
