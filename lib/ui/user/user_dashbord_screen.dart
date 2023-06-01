import 'package:flutter/material.dart';
import 'package:survey_project_front_end/enum/role.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/models/user_model.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/ui/admin/create_post_screen.dart';
import 'package:survey_project_front_end/ui/admin/survey_post_admin_detail_screen.dart';
import 'package:survey_project_front_end/ui/authendication/login_screen.dart';
import 'package:survey_project_front_end/ui/user/question_answer_dashbord.dart';
import 'package:survey_project_front_end/ui/user/response_dashbord.dart';
import 'package:survey_project_front_end/widgets/confirm_dialog_box.dart';
import 'package:survey_project_front_end/widgets/custom_drawer.dart';
import 'package:survey_project_front_end/widgets/survey_post_card.dart';

class UserDashbordScreen extends StatefulWidget {
  static const routeName = '/userdashbordscreen';
  final Users? userDetails;
  const UserDashbordScreen({
    super.key,
    this.userDetails,
  });

  @override
  State<UserDashbordScreen> createState() => _UserDashbordScreenState();
}

class _UserDashbordScreenState extends State<UserDashbordScreen> {
  String? title;
  @override
  Widget build(BuildContext context) {
    widget.userDetails?.roles == Roles.roleAdmin.names
        ? title = "Admin"
        : title = "User";
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("$title Dashbord"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ConfirmDialogBox(
                    message: "Do you want to Logout",
                    onConfirm: () {
                      ApiManager().logOut().then(
                            (value) => Navigator.pushNamed(
                              context,
                              LoginScreen.routeName,
                            ),
                          );
                    },
                    buttonText: "Logout",
                    textButtonText: "No",
                  );
                },
              );
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(
        name: widget.userDetails?.username,
        nameFontSize: 18.0,
        nameFontWeight: FontWeight.w500,
        nameTextColor: Colors.grey,
        flatButtonText: "Click to View Responses",
        buttonFontSize: 20.0,
        buttonFontWeight: FontWeight.w700,
        buttonTextColor: Colors.red,
        mail: widget.userDetails?.email,
        mailFontSize: 18.0,
        mailFontWeight: FontWeight.w500,
        mailTextColor: Colors.grey,
        onClickFunction: () {
          ApiManager()
              .getAllSurveyResponse(
            context,
          )
              .then(
            (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResponseDashbordScreen(
                      responseData: value,
                      userId: widget.userDetails?.id,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: FutureBuilder<List<dynamic>?>(
            future: ApiManager().getAllSurveyPost(
              context,
            ),
            builder: (context, AsyncSnapshot<List<dynamic>?> snapshot) {
              List<dynamic>? posts = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (context, index) {
                  return (posts?.length ?? 0) < 0
                      ? const Center(
                          child: Text(
                            "No Any Survey Posts are Created",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : SurveyPostCard(
                          surveyName: posts?[index]["surveyName"],
                          surveyId: posts?[index]["id"],
                          onClickCardFunction: widget.userDetails?.roles ==
                                  Roles.roleUser.names
                              ? () {
                                  ApiManager()
                                      .getSurveyPostById(
                                    context,
                                    posts?[index]["id"],
                                  )
                                      .then(
                                    (SurveyPosts? value) {
                                      if (value != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return QuestionAnswerDashbordScreen(
                                                surveyPosts: value,
                                                surveyName: posts?[index]
                                                    ["surveyName"],
                                                userDetails: widget.userDetails,
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  );
                                }
                              : () {
                                  ApiManager()
                                      .getSurveyPostById(
                                    context,
                                    posts?[index]["id"],
                                  )
                                      .then(
                                    (SurveyPosts? value) {
                                      if (value != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return SurveyPostAdminDetailScreen(
                                                surveyPosts: value,
                                                userDetails: widget.userDetails,
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                        );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: widget.userDetails?.roles == Roles.roleAdmin.names
          ? FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CreatePostSceen(
                        userDetails: widget.userDetails,
                      );
                    },
                  ),
                );
              },
              child: const Icon(
                Icons.add,
              ),
            )
          : Container(),
    );
  }
}
