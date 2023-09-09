import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/constants.dart';
import 'package:survey_app/questionaire_screen.dart';
import 'package:survey_app/select_state.dart';
import 'package:survey_app/widgets/def_btn.dart';

class DisclaimerScreen extends StatelessWidget {
  const DisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Disclaimer'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                  'Participation in this survey is an entirely voluntary act, and we want to underscore the paramount importance we place on safeguarding the confidentiality and anonymity of your responses, guaranteeing the utmost security for your personal information throughout our research endeavor; your candid and precise answers are pivotal in ensuring the accuracy and reliability of our data; by electing to continue, you provide your informed consent, underscoring your willingness to actively contribute to the unequivocal success of our research efforts; if you harbor any concerns or require further elucidation regarding our meticulous data handling protocols, we cordially invite you to peruse our comprehensive privacy policy or initiate direct contact with us through the communication channels we have thoughtfully provided.'),
              const SizedBox(
                height: 40,
              ),
              const Spacer(),
              DefaultButton(
                  text: 'Proceed',
                  press: () => Get.to(() => const LocationSelector())),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ));
  }
}
