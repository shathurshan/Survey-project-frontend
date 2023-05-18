import 'package:flutter/material.dart';

class SurveyPostCard extends StatelessWidget {
  final String? surveyName;
  final String? createdDate;
  final String? surveyId;
  final Color? surveyNameTextColor;
  final Function()? onClickCardFunction;
  const SurveyPostCard({
    super.key,
    required this.surveyName,
    this.createdDate,
    this.surveyNameTextColor,
    this.onClickCardFunction,
    this.surveyId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClickCardFunction,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 40.0,
          bottom: 40.0,
        ),
        margin: const EdgeInsets.only(
          top: 10.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              surveyName ?? "Survey Name",
              style: TextStyle(
                color: surveyNameTextColor ?? Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Created Date: ${createdDate ?? "2023-05-10"}",
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w800,
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Id: ${surveyId ?? "No Id"}",
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w800,
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
