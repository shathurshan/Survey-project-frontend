import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/widgets/custom_drawer.dart';
import 'package:survey_project_front_end/widgets/survey_post_card.dart';

class UserDashbordScreen extends StatefulWidget {
  static const routeName = '/userdashbordscreen';
  final String? type;
  final String? token;
  const UserDashbordScreen({
    super.key,
    this.type,
    this.token,
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
        name: "Shathurshan",
        nameFontSize: 18.0,
        nameFontWeight: FontWeight.w500,
        nameTextColor: Colors.grey,
        flatButtonText: "Click to View Responses",
        buttonFontSize: 20.0,
        buttonFontWeight: FontWeight.w700,
        buttonTextColor: Colors.red,
        mail: "ravishathu856@gmail.com",
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
          child: FutureBuilder<SurveyPosts?>(
            future: ApiManager().getSurveyPost(
              context,
              widget.type,
              widget.token,
            ),
            builder: (context, AsyncSnapshot<SurveyPosts?> snapshot) {
              SurveyPosts? posts = snapshot.data;
              return SurveyPostCard(
                surveyName: posts?.surveyName,
              );
            },
          ),
        ),
      ),
    );
  }
}
