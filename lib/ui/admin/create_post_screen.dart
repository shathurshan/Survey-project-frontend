import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/user_model.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/ui/admin/question_card.dart';
import 'package:survey_project_front_end/widgets/custom_button.dart';

class CreatePostSceen extends StatefulWidget {
  static const routeName = '/createsurveypostscreen';
  final Users? userDetails;
  const CreatePostSceen({
    super.key,
    this.userDetails,
  });

  @override
  State<CreatePostSceen> createState() => _CreatePostSceenState();
}

class _CreatePostSceenState extends State<CreatePostSceen> {
  int i = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Survey"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: "Survey Name",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: i,
                itemBuilder: (context, index) {
                  return QueationAnswerCard(
                    queNumber: i,
                    onclickCloseFunction: () {
                      if (i > 1) {
                        setState(() {
                          i--;
                        });
                      }
                    },
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    i++;
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(
        buttonHeight: 70,
        text: "Post",
        onClick: () {
          ApiManager().createPost(
            context,
            widget.userDetails?.type,
            widget.userDetails?.token,
          );
        },
        fontSize: 40,
        fontWeight: FontWeight.w800,
        buttonBackroundColor: Colors.blueGrey,
      ),
    );
  }
}
