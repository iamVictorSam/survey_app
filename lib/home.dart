import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/constants.dart';
import 'package:survey_app/select_survey_screen.dart';
import 'package:survey_app/widgets/def_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  List others = [
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

  List colors = [
    const Color(0xff00827f),
    const Color(0xffb281fc),
    const Color.fromARGB(255, 3, 3, 3),
    const Color.fromARGB(255, 55, 55, 56),
    const Color(0xff53446A),
    const Color(0xff50CA94),

    //#50CA94
    //#53446A

    //#b281fc
  ];

  bool seeOthers = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Image.asset('assets/Travi Logo 2.jpg'),
        title: const Text(
          'Survey App',
          style:
              TextStyle(color: Color(0xff53446A), fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            seeOthers
                ? SizedBox(
                    // height: 400,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: others.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 15,
                          crossAxisCount: size.width > 415 ? 1 : 2,
                          // mainAxisExtent: ,
                          childAspectRatio: size.width > 415 ? 1 : 1.1,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return ClayContainer(
                          color: colors[index],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                others[index]['title'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${others[index]['questionDone']} of ${others[index]['totalQuestion']}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : SizedBox(
                    // height: 400,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: surveyData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 15,
                              crossAxisCount: 2,
                              // mainAxisExtent: ,
                              childAspectRatio: 1.1,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return ClayContainer(
                          color: colors[index],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                surveyData[index]['title'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${surveyData[index]['questionDone']} of ${surveyData[index]['totalQuestion']}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            TextButton(
                onPressed: () {
                  setState(() {
                    seeOthers = !seeOthers;
                  });
                },
                child: const Text(
                  'See more',
                  style: TextStyle(
                      color: kPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
            // const SizedBox(
            //   height: 20,
            // ),
            const Spacer(),
            DefaultButton(
              text: 'Start Survey',
              press: () {
                Get.to(() => SelectSurveyScreen());
              },
            ),
            const Spacer(),

            // const SizedBox(
            //   height: 10,
            // ),
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
  final Color color;

  const ClayContainer(
      {super.key,
      this.width = 40,
      this.height = 40,
      required this.child,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(4.0, 4.0),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
          const BoxShadow(
            color: Colors.black,
            offset: Offset(-3.0, -3.0),
            blurRadius: 4.0,
            spreadRadius: 1,
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
