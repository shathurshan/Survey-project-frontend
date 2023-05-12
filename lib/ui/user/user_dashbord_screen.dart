import 'package:flutter/material.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/widgets/custom_drawer.dart';
import 'package:survey_project_front_end/widgets/survey_post_card.dart';

class UserDashbordScreen extends StatefulWidget {
  static const routeName = '/userdashbordscreen';
  const UserDashbordScreen({super.key});

  @override
  State<UserDashbordScreen> createState() => _UserDashbordScreenState();
}

class _UserDashbordScreenState extends State<UserDashbordScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiManager().getSurveyPost();
  }

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
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return const SurveyPostCard(
                surveyName: "User Survey Salary",
              );
            },
          ),
        ),
      ),
    );
  }
}
