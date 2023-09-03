import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:survey_app/login/login.dart';
import 'package:survey_app/sign_up/sign_up.dart';
import 'package:survey_app/widgets/def_btn.dart';
import 'package:survey_app/widgets/default_button2.dart';

class RegSelection extends StatelessWidget {
  const RegSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: (7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Welcome to \n',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple,
                  fontSize: 25.sp,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Couria',
                    style: TextStyle(
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFFEB2326),
                      fontSize: 45.sp,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: (7),
            ),
            DefaultButton(
              press: () {
                Get.to(const LoginScreen());
              },
              text: 'Log in',
            ),
            const SizedBox(
              height: (2),
            ),
            DefaultBtn2(
                press: () => Get.to(
                      () => const SignUpScreen(),
                    ),
                text: 'Sign up')
          ],
        ),
      ),
    );
  }
}
