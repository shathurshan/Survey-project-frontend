import 'package:flutter/material.dart';
import 'package:survey_project_front_end/enum/role.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/models/user_model.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/ui/admin/create_post_screen.dart';
import 'package:survey_project_front_end/ui/admin/survey_post_admin_detail_scree.dart';
import 'package:survey_project_front_end/ui/user/question_answer_dashbord.dart';
import 'package:survey_project_front_end/ui/user/response_dashbord.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("User Dashbord"),
        centerTitle: true,
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
            widget.userDetails?.type,
            widget.userDetails?.token,
          )
              .then(
            (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResponseDashbordScreen(
                      responseData: value,
                      token: widget.userDetails?.token,
                      type: widget.userDetails?.type,
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
              widget.userDetails?.type,
              widget.userDetails?.token,
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
                  return SurveyPostCard(
                    surveyName: posts?[index]["surveyName"],
                    surveyId: posts?[index]["id"],
                    onClickCardFunction:
                        widget.userDetails?.roles == Roles.roleUser.names
                            ? () {
                                ApiManager()
                                    .getSurveyPostById(
                                  context,
                                  widget.userDetails?.type,
                                  widget.userDetails?.token,
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
                                  widget.userDetails?.type,
                                  widget.userDetails?.token,
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
