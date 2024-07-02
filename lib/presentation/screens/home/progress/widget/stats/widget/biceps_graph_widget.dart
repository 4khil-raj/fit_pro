// ignore_for_file: prefer_const_constructors

import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class BicepsGraphWidget extends StatelessWidget {
  const BicepsGraphWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5, // Adjust aspect ratio as needed for your design
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: DChartBarO(
              groupList: [
                OrdinalGroup(
                  color: Colors.green,
                  id: '1',
                  data: [
                    OrdinalData(domain: 'Thu', measure: 1.2),
                    OrdinalData(domain: 'Wed', measure: 1.9),
                    OrdinalData(
                      domain: '',
                      measure: 2.5,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            // Adjust the top position as needed
            right: 40, bottom: 1, // Adjust the right position as needed
            child: Text(
              "20 jul,2024",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            // Adjust the top position as needed
            // Adjust the right position as needed
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "25 may,2024",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            // Adjust the top position as needed
            left: 40, bottom: 1, // Adjust the right position as needed
            child: Text(
              "10 may,2024",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class BicepsPickerInProgressScreen extends StatefulWidget {
  const BicepsPickerInProgressScreen({super.key});

  @override
  State<BicepsPickerInProgressScreen> createState() =>
      _WeightPickerInProgressScreenState();
}

class _WeightPickerInProgressScreenState
    extends State<BicepsPickerInProgressScreen> {
  int _currentIntValue = 14;
  int _currentLbValue = 14;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 21.0, top: 8, bottom: 8),
          child: Text(
            "Biceps",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 33, 208, 243)),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Text("CM",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600))),
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: const Color.fromARGB(255, 33, 208, 243),
              ),
              // color: const Color.fromARGB(255, 33, 208, 243)),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "INCH",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
        NumberPicker(
          itemHeight: 60,
          selectedTextStyle: GoogleFonts.urbanist(
              color: const Color.fromARGB(255, 72, 173, 255),
              fontSize: 30,
              fontWeight: FontWeight.w800),
          textStyle: GoogleFonts.urbanist(
              color: const Color.fromARGB(255, 225, 217, 217), fontSize: 25),
          value: _currentLbValue,
          minValue: 0,
          maxValue: 200,
          itemWidth: double.infinity,
          step: 1,
          axis: Axis.vertical,
          haptics: true,
          onChanged: (value) => setState(() => _currentLbValue = value),
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: CustomButton(
                isNetwork: false,
                isRow: false,
                borderclr: Colors.transparent,
                color: const Color.fromARGB(255, 93, 93, 93),
                height: 40,
                fontweight: FontWeight.w600,
                textsize: 15,
                name: "Cancel",
                radius: 10,
                onTap: () {},
                textclr: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: CustomButton(
                isNetwork: false,
                isRow: false,
                borderclr: Colors.transparent,
                color: Colors.yellow,
                height: 40,
                fontweight: FontWeight.w600,
                textsize: 15,
                name: "Update Biceps",
                radius: 10,
                onTap: () {},
                textclr: Colors.black,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        )
      ],
    );
  }
}
