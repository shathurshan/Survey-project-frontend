// ignore_for_file: equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:survey_project_front_end/ui/admin/create_post_screen.dart';
import 'package:survey_project_front_end/ui/admin/survey_post_admin_detail_scree.dart';
import 'package:survey_project_front_end/ui/authendication/login_screen.dart';
import 'package:survey_project_front_end/ui/authendication/register_screen.dart';
import 'package:survey_project_front_end/ui/user/question_answer_dashbord.dart';
import 'package:survey_project_front_end/ui/user/response_dashbord.dart';
import 'package:survey_project_front_end/ui/user/user_dashbord_screen.dart';
import 'package:survey_project_front_end/ui/user/view_response_screen.dart';

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
        QuestionAnswerDashbordScreen.routeName: (ctx) =>
            const QuestionAnswerDashbordScreen(),
        ResponseDashbordScreen.routeName: (ctx) =>
            const ResponseDashbordScreen(),
        ViewResponseScreen.routeName: (ctx) => const ViewResponseScreen(),
        SurveyPostAdminDetailScreen.routeName: (ctx) =>
            const SurveyPostAdminDetailScreen(),
      },
    );
  }
}
