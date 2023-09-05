import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:survey_app/constants.dart';
import 'package:survey_app/sign_in/sign_in.dart';
import 'package:survey_app/sign_up/sign_up.dart';
import 'package:survey_app/widgets/def_btn.dart';
import 'package:survey_app/widgets/default_button2.dart';

class RegSelection extends StatelessWidget {
  const RegSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
                fontSize: 20.sp,
              ),
            ),
            Text(
              'Travi Survey',
              style: TextStyle(
                letterSpacing: 1.2,
                fontWeight: FontWeight.w700,
                color: const Color(0xff50CA94),
                fontSize: 30.sp,
              ),
            ),
            SizedBox(height: 30.h),
            DefaultButton(
              press: () {
                Get.to(SignInScreen());
              },
              text: 'Log in',
            ),
            SizedBox(height: 10.h),
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
