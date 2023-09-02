import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/select_survey_screen.dart';
import 'package:survey_app/widgets/def_btn.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List surveyData = [
    {
      'title': 'Terminal',
      'questionDone': 26,
      'totalQuestion': 50,
    },
    {
      'title': 'Transporter',
      'questionDone': 6,
      'totalQuestion': 30,
    },
    {
      'title': 'Union',
      'questionDone': 59,
      'totalQuestion': 100,
    },
    {
      'title': 'Insurance',
      'questionDone': 0,
      'totalQuestion': 20,
    },
    {
      'title': 'Hotel',
      'questionDone': 1,
      'totalQuestion': 27,
    },
    {
      'title': 'Rail',
      'questionDone': 7,
      'totalQuestion': 38,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: surveyData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 15, crossAxisCount: 2, crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return ClayContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        surveyData[index]['title'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${surveyData[index]['questionDone']} of ${surveyData[index]['totalQuestion']}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultButton(
              text: 'Start Survey',
              press: () {
                Get.to(() => SelectSurveyScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}

class ClayContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const ClayContainer(
      {super.key, this.width = 120, this.height = 120, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(4.0, 4.0),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: child,
    );
  }
}

class SurveyModel {
  final String title;
  final int questionDone;
  final int totalQuestion;

  SurveyModel(
      {required this.questionDone,
      required this.totalQuestion,
      required this.title});
}
