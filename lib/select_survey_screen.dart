import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:survey_app/user_intro_screen.dart';

// ignore: must_be_immutable
class SelectSurveyScreen extends StatelessWidget {
  SelectSurveyScreen({Key? key}) : super(key: key);

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
      'questionDone': 20,
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
    {
      'title': 'Sea Port',
      'questionDone': 1,
      'totalQuestion': 27,
    },
    {
      'title': 'Airport',
      'questionDone': 7,
      'totalQuestion': 38,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Start Survey'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: surveyData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Tile(
                      press: () => Get.to(() => const UserIntroScreen()),
                      surveyData: surveyData[index],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({super.key, this.surveyData, required this.press});

  final surveyData;

  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListTile(
        onTap: press,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.zero,
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Checkbox.adaptive(
              value: surveyData['questionDone'] == surveyData['totalQuestion'],
              onChanged: (value) {}),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            surveyData['title'],
            style: const TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        trailing: Container(
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 5, // Blur radius
                offset: const Offset(0, 3), // Offset of the shadow
              ),
            ],
          ),
          child: Text(
            '${surveyData['questionDone']} of ${surveyData['totalQuestion']}',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontStyle: FontStyle.italic, color: Colors.black, fontSize: 9),
          ),
        ),
      ),
    );
  }
}
