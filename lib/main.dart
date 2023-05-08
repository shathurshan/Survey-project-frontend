import 'package:flutter/material.dart';
import 'package:survey_project_front_end/ui/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
