import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/preview_screen.dart';
import 'package:survey_app/widgets/def_btn.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _totalQuestions = 3;
  final List<String> _answers = List.filled(3, "");

  void _nextPage() {
    if (_currentPage < _totalQuestions - 1) {
      setState(() {
        _currentPage++;
        _pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _pageController.previousPage(
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      });
    }
  }

  void _submitAnswers() {
    // // Implement your logic for submitting answers here
    // // You can access the answers in the _answers list.
    // print("Answers submitted: $_answers");
    Get.to(() => PreviewScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionnaire'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _totalQuestions,
              itemBuilder: (context, index) {
                return QuestionPage(
                  questionNumber: index + 1,
                  totalQuestions: _totalQuestions,
                  answer: _answers[index],
                  onAnswerChanged: (value) {
                    setState(() {
                      _answers[index] = value;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: _currentPage > 0,
                  child: TextButton(
                    onPressed: _previousPage,
                    child: const Text('Previous'),
                  ),
                ),
                if (_currentPage < _totalQuestions - 1)
                  SizedBox(
                    width: 100,
                    child: DefaultButton(
                      press: _nextPage,
                      text: ('Next'),
                    ),
                  ),
                if (_currentPage == _totalQuestions - 1)
                  SizedBox(
                    width: 150,
                    child: DefaultButton(
                      press: _submitAnswers,
                      text: ('Submit'),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${_currentPage + 1} of $_totalQuestions answered',
            ),
          ),
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

class QuestionPage extends StatelessWidget {
  final int questionNumber;
  final int totalQuestions;
  final String answer;
  final ValueChanged<String> onAnswerChanged;

  const QuestionPage({
    super.key,
    required this.questionNumber,
    required this.totalQuestions,
    required this.answer,
    required this.onAnswerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Question $questionNumber:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: Get.height * 0.2),
          const Text(
            'What is your answer?',
            style: TextStyle(fontSize: 16),
          ), // Replace with your question
          const SizedBox(height: 40),
          TextFormField(
            initialValue: answer,
            onChanged: onAnswerChanged,
            decoration: const InputDecoration(
              // border: OutlineInputBorder(),
              hintText: 'Type your answer here',
            ),
          ),
        ],
      ),
    );
  }
}
