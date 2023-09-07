import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:survey_app/home.dart';
import 'package:survey_app/select_survey_screen.dart';
import 'package:survey_app/widgets/def_btn.dart';

class PreviewScreen extends StatelessWidget {
  // final questionsAndAnswers;

  PreviewScreen({
    super.key,
  });

  List questionsAndAnswers = [
    {
      'question': 'What is your name',
      'answer': 'What is your name',
    },
    {
      'question': 'What is your name',
      'answer': 'What is your name',
    },
    {
      'question': 'What is your name',
      'answer': 'What is your name',
    },
    {
      'question': 'What is your name',
      'answer': 'What is your name',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: questionsAndAnswers.length,
            itemBuilder: (context, index) {
              final question = questionsAndAnswers[index]['question'];
              final answer = questionsAndAnswers[index]['answer'];
              final questionNumber = index + 1;

              return ListTile(
                title: Text('Question $questionNumber: $question'),
                subtitle: Text('Answer: $answer'),
              );
            },
          ),
          const Spacer(),
          // const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DefaultButton(
                text: 'Submit',
                press: () {
                  Get.offAll(() => const HomeScreen());
                  Get.to(() => SelectSurveyScreen());
                }),
          ),
          const SizedBox(height: 40),
          Image.asset(
            'assets/Travi Logo.jpg',
            // fit: BoxFit.cover,
            height: 60,
          ),
        ],
      ),
    );
  }
}
