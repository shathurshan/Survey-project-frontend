import 'package:flutter/material.dart';
import 'package:survey_project_front_end/ui/admin/answer_field.dart';

class QueationAnswerCard extends StatefulWidget {
  final Function()? onclickCloseFunction;
  final int? queNumber;
  const QueationAnswerCard({
    super.key,
    required this.onclickCloseFunction,
    this.queNumber,
  });

  @override
  State<QueationAnswerCard> createState() => _QueationAnswerCardState();
}

class _QueationAnswerCardState extends State<QueationAnswerCard> {
  int y = 1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 400,
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        margin: const EdgeInsets.only(
          bottom: 10.0,
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
            IconButton(
              onPressed: widget.onclickCloseFunction,
              icon: const Icon(
                Icons.close,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Question ${widget.queNumber}",
                labelStyle: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: y,
                    itemBuilder: (context, index) {
                      return CreatePostAnswerField(
                        answerNumber: y,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 7.0,
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          y++;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                    if (y >= 2)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            y--;
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
