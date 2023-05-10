import 'package:flutter/material.dart';
import 'package:survey_project_front_end/ui/admin/question_card.dart';
import 'package:survey_project_front_end/widgets/custom_button.dart';

class CreatePostSceen extends StatefulWidget {
  static const routeName = '/createsurveypostscreen';
  const CreatePostSceen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
          top: 20.0,
          bottom: 20.0,
        ),
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: i,
              itemBuilder: (context, index) {
                return QueationAnswerCard(
                  onclickCloseFunction: () {
                    if (i > 0) {
                      i--;
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
      bottomNavigationBar: CustomButton(
        buttonHeight: 70,
        text: "Post",
        onClick: () {},
        fontSize: 40,
        fontWeight: FontWeight.w800,
        buttonBackroundColor: Colors.blueGrey,
      ),
    );
  }
}
