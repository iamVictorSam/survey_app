import 'package:flutter/material.dart';

class SelectSurveyScreen extends StatelessWidget {
  const SelectSurveyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Start Survey'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
