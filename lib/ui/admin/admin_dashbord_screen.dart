import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/ui/admin/create_post_screen.dart';
import 'package:survey_project_front_end/widgets/custom_drawer.dart';
import 'package:survey_project_front_end/widgets/survey_post_card.dart';

class AdminDashbordScreen extends StatefulWidget {
  static const routeName = '/admindashbordscreen';
  final String? type;
  final String? token;
  const AdminDashbordScreen({
    super.key,
    this.token,
    this.type,
  });

  @override
  State<AdminDashbordScreen> createState() => _AdminDashbordScreenState();
}

class _AdminDashbordScreenState extends State<AdminDashbordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Admin Dashbord"),
        centerTitle: true,
      ),
      drawer: CustomDrawer(
        name: "Shathurshan",
        nameFontSize: 18.0,
        nameFontWeight: FontWeight.w500,
        nameTextColor: Colors.grey,
        flatButtonText: "Click to View Users Answers",
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).pushNamed(
            CreatePostSceen.routeName,
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
