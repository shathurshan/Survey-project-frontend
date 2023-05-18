import 'package:flutter/material.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/widgets/survey_post_card.dart';

class ResponseDashbordScreen extends StatefulWidget {
  static const routeName = '/responsedashbordscreen';
  final String? token;
  final String? type;
  const ResponseDashbordScreen({
    super.key,
    this.token,
    this.type,
  });

  @override
  State<ResponseDashbordScreen> createState() => _ResponseDashbordScreenState();
}

class _ResponseDashbordScreenState extends State<ResponseDashbordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Response Dashbord"),
        centerTitle: true,
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
            future: ApiManager().getAllSurveyResponse(
              context,
              widget.type,
              widget.token,
            ),
            builder: (context, snapshot) {
              List<dynamic>? response = snapshot.data;
              print(response);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: response?.length,
                itemBuilder: (context, index) {
                  return SurveyPostCard(
                    surveyName: response?[index]["surveyName"],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
