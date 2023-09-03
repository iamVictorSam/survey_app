import 'package:flutter/material.dart';
import 'package:survey_app/sign_in/components/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      body: Body(formKey: _formKey),
    );
  }
}
