import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.text, required this.press});

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        fixedSize: Size(Get.width, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onPressed: press,
      child: Text(text),
    );
  }
}
