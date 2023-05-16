import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/user_model.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/ui/authendication/register_screen.dart';
import 'package:survey_project_front_end/ui/user/user_dashbord_screen.dart';
import 'package:survey_project_front_end/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginscreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String? userName;
  String? pasword;

  void submitSignInForm() {
    final isValid = formKey.currentState?.validate();
    if ((isValid ?? false)) {
      ApiManager()
          .signInUsers(
        context,
        userName?.trim(),
        pasword?.trim(),
      )
          .then(
        (Users? value) {
          if (value != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return UserDashbordScreen(
                    userDetails: value,
                  );
                },
              ),
            );
          }
        },
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
              top: 200.0,
              bottom: 100.0,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 200,
                    child: Image.network(
                      "https://www.voxco.com/wp-content/uploads/2021/10/Methodological-Limitations-of-Survey-Research1.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
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
                  CustomButton(
                    text: "Login",
                    buttonBackroundColor: Colors.blueGrey,
                    fontSize: 20,
                    onClick: submitSignInForm,
                  ),
                  TextButton(
                    child: const Text(
                      "Create Account",
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        RegisterScreen.routeName,
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
