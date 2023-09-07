import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/constants.dart';
import 'package:survey_app/disclaimer.dart';
import 'package:survey_app/questionaire_screen.dart';
import 'package:survey_app/widgets/def_btn.dart';

class UserIntroScreen extends StatelessWidget {
  const UserIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Introduction'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text.rich(
                TextSpan(text: 'Hi I\'m', children: [
                  TextSpan(
                      text: ' Jessica Waltz ',
                      style: TextStyle(color: kPurple)),
                  TextSpan(text: 'from'),
                  TextSpan(
                      text: ' Travi Mobile Survey ',
                      style: TextStyle(color: Colors.green)),
                  TextSpan(text: '-Your Motor Pack Survey Expert'),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  'Travi brings a wealth of experience and expertise to the table, making them a standout leader in the industry. Their journey has been one marked by dedication, meticulous attention to detail, and an unrelenting pursuit of excellence.'),
              const SizedBox(
                height: 40,
              ),
              const Spacer(),
              DefaultButton(
                  text: 'Proceed',
                  press: () => Get.to(() => const DisclaimerScreen())),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ));
  }
}
