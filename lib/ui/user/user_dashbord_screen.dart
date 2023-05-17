import 'package:flutter/material.dart';
import 'package:survey_project_front_end/enum/role.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/models/user_model.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/ui/admin/create_post_screen.dart';
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
        onClickFunction: () {},
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
              print("nker${snapshot.data?[1]}");
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return SurveyPostCard(
                    surveyName: snapshot.data?[index]["surveyName"],
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
