import 'package:flutter/material.dart';
import 'package:survey_project_front_end/ui/admin/create_post_screen.dart';
import 'package:survey_project_front_end/ui/authendication/login_screen.dart';
import 'package:survey_project_front_end/ui/authendication/register_screen.dart';
import 'package:survey_project_front_end/ui/user/user_dashbord_screen.dart';

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
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        RegisterScreen.routeName: (ctx) => const RegisterScreen(),
        UserDashbordScreen.routeName: (ctx) => const UserDashbordScreen(),
        CreatePostSceen.routeName: (ctx) => const CreatePostSceen(),
      },
    );
  }
}
