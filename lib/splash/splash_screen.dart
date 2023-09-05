import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:survey_app/reg_selection/reg_selection.dart';
import 'package:survey_app/widgets/def_btn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// List<MyClass> selecteditems = List();
class _SplashScreenState extends State<SplashScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: SafeArea(
        child: Column(children: [
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const RegSelection()),
                  (route) => false),
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          // SizedBox(height: 20.h),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   stops: [0.1, 0.4, 0.7, 0.9],
                //   colors: [
                //     Color(0xFFFAF7FC),
                //     Color(0xFFEBEBEB),
                //     Color(0xFFC9C8CA),
                //     Color(0xFFD8D6DA),
                //   ],
                // ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: (500.0),
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        page1(),
                        page2(),
                        page3(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  // const SizedBox(height: 30),

                  const Spacer(),
                  _currentPage != _numPages - 1
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: DefaultButton(
                              press: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              text: 'Next'),
                        )
                      : Container(),
                  _currentPage == _numPages - 1
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: DefaultButton(
                              press: () {
                                Get.offAll(const RegSelection());
                              },
                              text: 'Get Started'),
                        )
                      : Container(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 6.0,
      width: isActive ? 20.0 : 14.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.deepPurple : const Color(0xFF9595B7),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

Widget page1() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: (8),
        ),
        Image.asset(
          'assets/survey-ficon1.png',
          height: 300,
        ),
        const SizedBox(
          height: (9),
        ),
        Text(
          'Digitalization Project',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'We revamp the transport sector\nwith digital tools\nfor effective and efficient service delivery.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        )
        // Container(decoration: BoxDecoration)
      ]);
}

Widget page2() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: (9),
        ),
        Center(
            child: Image.asset(
          'assets/survey-icon2.png',
          height: 300,
        )),
        // const SizedBox(
        //   height: (11.5),
        // ),
        Text(
          'Onboarding Operators',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'We aim to reduce insecurities, increase safety of Commuter and Drivers as well as customer relationship module',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        )
        // Container(decoration: BoxDecoration)
      ]);
}

Widget page3() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: (9),
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Image.asset(
            'assets/survey-icon4.png',
            height: 350,
          ),
        )),
        const SizedBox(
          height: (11.5),
        ),
        Text(
          'Supporting Stakeholders',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
        const SizedBox(
          height: (2.5),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'We position you in the market to gain advantage and achieve return on investment in the sector.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        )
        // Container(decoration: BoxDecoration)
      ]);
}
