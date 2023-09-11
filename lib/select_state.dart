import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:survey_app/questionaire_screen.dart';
import 'package:survey_app/state_obj.dart';
import 'package:survey_app/widgets/def_btn.dart';

class LocationSelector extends StatefulWidget {
  const LocationSelector({super.key});

  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  String selectedState = "Abia";
  String selectedCity = "Umuahia";

  Position? position;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Selector"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Select a State:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)),
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(),
                value: selectedState,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedState = newValue!;
                    // Update the selected city based on the selected state
                    selectedCity = stateAndCity[newValue] ?? "";
                  });
                },
                items: stateAndCity.keys.map((String state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            // const Text(
            //   "City:",
            //   style: TextStyle(fontSize: 16),
            // ),
            // const SizedBox(height: 10),
            // Container(
            //     width: Get.width,
            //     decoration: BoxDecoration(
            //         color: Colors.grey[100],
            //         borderRadius: BorderRadius.circular(8)),
            //     padding: const EdgeInsets.all(20),
            //     child: Text(selectedCity)),
            const SizedBox(height: 30),
            const Text(
              "Enter Town",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)),
              child: const TextField(
                decoration: InputDecoration(
                    // filled: true,
                    // fillColor: Colors.grey[100],
                    hintText: 'Town',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: InputBorder.none),
              ),
            ),
            const Spacer(),
            DefaultButton(
                text: 'Continue',
                press: () => Get.to(() => const QuestionnaireScreen())),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
