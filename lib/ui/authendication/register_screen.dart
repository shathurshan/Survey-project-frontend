import 'package:flutter/material.dart';
import 'package:survey_project_front_end/enum/role.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/ui/admin/admin_dashbord_screen.dart';
import 'package:survey_project_front_end/ui/authendication/login_screen.dart';
import 'package:survey_project_front_end/ui/user/user_dashbord_screen.dart';
import 'package:survey_project_front_end/widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/registerscreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Roles? _roleForUser = Roles.roleUser;
  String? userName;
  String? mail;
  String? pasword;
  String? role;

  void submitSignUpForm() {
    final isValid = formKey.currentState?.validate();
    if ((isValid ?? false) && (role ?? "").isNotEmpty) {
      formKey.currentState?.save();
      ApiManager().signUpUsers(
        context,
        userName,
        mail,
        pasword,
        role,
      );
      role == Roles.roleAdmin.names
          ? Navigator.of(context).pushNamed(
              AdminDashbordScreen.routeName,
            )
          : Navigator.of(context).pushNamed(
              UserDashbordScreen.routeName,
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 150.0,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (String? value) {
                      userName = value;
                      if ((value ?? "").isEmpty) {
                        return "Please Enter User Name";
                      } else if ((value ?? "").length < 4) {
                        return "User Name must be atleast 4 characters long";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "User Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      mail = value;
                      if ((value ?? "").isEmpty) {
                        return "Please Enter Email-Id";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Email-Id",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (String? value) {
                      pasword = value;
                      if ((value ?? "").isEmpty) {
                        return "Please Enter Password";
                      } else if ((value ?? "").length < 8) {
                        return "Password must be atleast 8 characters long";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (String? value) {
                      if ((value ?? "").isEmpty) {
                        return "Please Re-Enter Password";
                      } else if ((value ?? "").length < 8) {
                        return "Password must be atleast 8 characters long";
                      } else if (value != pasword) {
                        return "Password must be same as above";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "What is your Role?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  RadioListTile<Roles>(
                    title: const Text(
                      'Admin',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    value: Roles.roleAdmin,
                    groupValue: _roleForUser,
                    onChanged: (Roles? value) {
                      setState(() {
                        _roleForUser = value;
                        role = Roles.roleAdmin.names;
                      });
                    },
                  ),
                  RadioListTile<Roles>(
                    title: const Text(
                      'User',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    value: Roles.roleUser,
                    groupValue: _roleForUser,
                    onChanged: (Roles? value) {
                      setState(() {
                        _roleForUser = value;
                        role = Roles.roleUser.names;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomButton(
                    text: "Create Account",
                    buttonBackroundColor: Colors.blueGrey,
                    fontSize: 20,
                    onClick: submitSignUpForm,
                  ),
                  TextButton(
                    child: const Text(
                      "Login",
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        LoginScreen.routeName,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
