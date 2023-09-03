import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:survey_app/home.dart';
import 'package:survey_app/widgets/def_btn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: (7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: Get.height * 0.17),
                    const Text(
                      "Login",
                      // style: headingStyle,
                    ),
                    const SizedBox(height: (2.5)),
                    const Text('Login with your phone number',
                        style: TextStyle(
                          color: Color(0xFF424242),
                        )),
                    const SizedBox(height: (3)),
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: controller,
                      formatInput: false,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputBorder: const OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                    SizedBox(height: Get.height * 0.4),
                    const Text(
                      'Login in with Facebook',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    const SizedBox(height: (2.5)),
                    DefaultButton(
                      text: 'Continue',
                      press: () {
                        Get.offAll(() => HomeScreen());
                      },
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     formKey.currentState.validate();
                    //   },
                    //   child: Text('Validate'),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     getPhoneNumber('+15417543010');
                    //   },
                    //   child: Text('Update'),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     formKey.currentState.save();
                    //   },
                    //   child: Text('Save'),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
