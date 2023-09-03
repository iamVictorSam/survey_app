import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                height: 32.5,
              ),
              const Text(
                'Sign Up',
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 5.5,
                ),
              ),
              const SizedBox(
                height: (5.7),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Jane Doe',
                        // prefixIcon: Padding(
                        //   padding: const EdgeInsets.all(10.0),
                        //   child: SvgPicture.asset("assets/icon/flag.svg"),
                        // ),
                      ),
                    ),
                    const SizedBox(
                      height: (5),
                    ),
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
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'autupsyofjanedoe@gmail.com',
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(Icons.mail_outlined),
                        ),
                        // Icon(Icons.mail_outlined, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: (4),
              ),
              DefaultButton(
                text: 'Sign up',
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                  // Get.to(const PhoneScreen());
                },
              ),
              const SizedBox(
                height: (4),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HorizontalLine(),
                    Text('  OR SIGN UP WITH  ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                    HorizontalLine(),
                  ],
                ),
              ),
              const SizedBox(
                height: (4),
              ),
              const SignUpWith(),
              const SizedBox(
                height: (4),
              ),
              RichText(
                text: const TextSpan(
                  text: 'By clicking sign up I agree with ',
                  style: TextStyle(
                    fontSize: (2),
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: 'Terms of service and Privacy Policy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: (2),
                          decoration: TextDecoration.underline,
                          color: Colors.deepPurple,
                        ))
                  ],
                ),
              )
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
