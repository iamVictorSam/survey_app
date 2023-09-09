import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/questionaire_screen.dart';
import 'package:survey_app/widgets/def_btn.dart';

class LocationSelector extends StatefulWidget {
  const LocationSelector({super.key});

  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  // Map of states and their corresponding cities
  Map<String, String> stateAndCity = {
    "Abia": "Umuahia",
    "Adamawa": "Yola",
    "AkwaIbom": "Uyo",
    "Anambra": "Awka",
    "Bauchi": "Bauchi",
    "Bayelsa": "Yenagoa",
    "Benue": "Makurdi",
    "Borno": "Maiduguri",
    "CrossRiver": "Calabar",
    "Delta": "Asaba",
    "Ebonyi": "Abakaliki",
    "Edo": "Benin City",
    "Ekiti": "Ado-Ekiti",
    "Enugu": "Enugu",
    "Gombe": "Gombe",
    "Imo": "Owerri",
    "Jigawa": "Dutse",
    "Kaduna": "Kaduna",
    "Kano": "Kano",
    "Katsina": "Katsina",
    "Kebbi": "Birnin Kebbi",
    "Kogi": "Lokoja",
    "Kwara": "Ilorin",
    "Lagos": "Ikeja",
    "Nasarawa": "Lafia",
    "Niger": "Minna",
    "Ogun": "Abeokuta",
    "Ondo": "Akure",
    "Osun": "Osogbo",
    "Oyo": "Ibadan",
    "Plateau": "Jos",
    "Rivers": "Port Harcourt",
    "Sokoto": "Sokoto",
    "Taraba": "Jalingo",
    "Yobe": "Damaturu",
    "Zamfara": "Gusau",
  };

  String selectedState = "Abia"; // Initial state selection
  String selectedCity = "Umuahia"; // Initial city selection

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
            const Text(
              "City:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(20),
                child: Text(selectedCity)),
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
