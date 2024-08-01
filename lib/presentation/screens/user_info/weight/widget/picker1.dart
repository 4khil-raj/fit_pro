// ignore_for_file: prefer_const_constructors

import 'package:fit_pro/presentation/screens/user_info/weight/widget/kg_lb.dart';
import 'package:fit_pro/presentation/screens/user_info/weight/widget/picker_lb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

bool kg = true;
dynamic weightkgtrue = 15;
dynamic weightkgtrueGram = 0;

class HeightPickerInUserInfo extends StatefulWidget {
  const HeightPickerInUserInfo({super.key});

  @override
  State<HeightPickerInUserInfo> createState() =>
      _WeightPickerInProgressScreenState();
}

class _WeightPickerInProgressScreenState extends State<HeightPickerInUserInfo> {
  int _currentIntValue = 14;
  int _currentLbValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 21.0, top: 8, bottom: 8),
        //   child: Text(
        //     "Weight",
        //     style: TextStyle(
        //         color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        //   ),
        // ),
        kg
            ? GestureDetector(
                onTap: () {
                  kg = false;
                  setState(() {});
                },
                child: KgorlbcontainerWidget())
            : GestureDetector(
                onTap: () {
                  kg = true;
                  setState(() {});
                },
                child: KgorLbcontainerWidget2()),
        SizedBox(
          height: 20,
        ),
        kg
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: NumberPicker(
                        itemHeight: 100,
                        selectedTextStyle: GoogleFonts.urbanist(
                            color: const Color.fromARGB(255, 72, 173, 255),
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                        textStyle: GoogleFonts.urbanist(
                            color: const Color.fromARGB(255, 225, 217, 217),
                            fontSize: 25),
                        value: weightkgtrue,
                        minValue: 15,
                        maxValue: 200,
                        itemWidth: double.infinity,
                        step: 1,
                        axis: Axis.vertical,
                        haptics: true,
                        onChanged: (value) =>
                            setState(() => weightkgtrue = value),
                      ),
                    ),
                    Flexible(
                      child: NumberPicker(
                        itemHeight: 100,
                        selectedTextStyle: GoogleFonts.urbanist(
                            color: const Color.fromARGB(255, 72, 173, 255),
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                        textStyle: GoogleFonts.urbanist(
                            color: const Color.fromARGB(255, 225, 217, 217),
                            fontSize: 25),
                        value: weightkgtrueGram,
                        minValue: 0,
                        maxValue: 999,
                        itemWidth: double.infinity,
                        step: 1,
                        axis: Axis.vertical,
                        haptics: true,
                        onChanged: (value) =>
                            setState(() => weightkgtrueGram = value),
                      ),
                    ),
                    // Text('data'),
                  ],
                ),
              )
            : LbPickerWeight()
      ],
    );
  }
}
