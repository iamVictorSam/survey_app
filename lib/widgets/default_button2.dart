import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultBtn2 extends StatelessWidget {
  const DefaultBtn2({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.deepPurple)),

        onPressed: press,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.deepPurple,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        // borderSide: BorderSide(color: kPrimaryColor),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
