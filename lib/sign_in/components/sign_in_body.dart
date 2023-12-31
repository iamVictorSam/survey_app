import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:survey_app/home.dart';
import 'package:survey_app/widgets/def_btn.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.5,
              ),
              const Text(
                'Sign In',
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 35.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // TODO: work on this
                      // onSaved: (newValue) => email = newValue,
                      // onChanged: (value) {
                      //   if (value.isNotEmpty) {
                      //     removeError(error: kEmailNullError);
                      //   } else if (emailValidatorRegExp.hasMatch(value)) {
                      //     removeError(error: kInvalidEmailError);
                      //   }
                      //   return null;
                      // },
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     addError(error: kEmailNullError);
                      //     return "";
                      //   } else if (!emailValidatorRegExp.hasMatch(value)) {
                      //     addError(error: kInvalidEmailError);
                      //     return "";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Email',
                        hintText: 'autupsyofjanedoe@gmail.com',
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // onSaved: (newValue) => email = newValue,
                      // onChanged: (value) {
                      //   if (value.isNotEmpty) {
                      //     removeError(error: kEmailNullError);
                      //   } else if (emailValidatorRegExp.hasMatch(value)) {
                      //     removeError(error: kInvalidEmailError);
                      //   }
                      //   return null;
                      // },
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     addError(error: kEmailNullError);
                      //     return "";
                      //   } else if (!emailValidatorRegExp.hasMatch(value)) {
                      //     addError(error: kInvalidEmailError);
                      //     return "";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Password',
                        hintText: 'Password@1',
                        suffixIcon: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.remove_red_eye_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              DefaultButton(
                text: 'Sign In',
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                  Get.offAll(() => HomeScreen());
                },
              ),
              SizedBox(height: 15.h),
              const SizedBox(
                height: (4),
              ),
              const SignUpWith(),
              const SizedBox(
                height: (4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpWith extends StatelessWidget {
  const SignUpWith({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       boxShadow: const [
          //         BoxShadow(
          //           color: Color(0xffdbdbdb),
          //           blurRadius: 7,
          //           offset: Offset(0, 0.1),
          //           spreadRadius: 0.5,
          //         ),
          //       ],
          //     ),
          //     child: SvgPicture.asset('assets/icon/google icon.svg')),
          SizedBox(
            width: (4),
          ),
          // Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       boxShadow: const [
          //         BoxShadow(
          //           color: Color(0xffdbdbdb),
          //           blurRadius: 7,
          //           offset: Offset(0, 0.1),
          //           spreadRadius: 0.5,
          //         ),
          //       ],
          //     ),
          //     child: SvgPicture.asset('assets/icon/facebook.svg')),
        ]);
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.grey),
        height: (0.3),
        // width: (10),
      ),
    );
  }
}
