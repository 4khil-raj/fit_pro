// ignore_for_file: prefer_const_constructors

import 'package:fit_pro/presentation/screens/user_info/height/height.dart';
import 'package:fit_pro/presentation/screens/user_info/height/widget/ft_cm.dart';
import 'package:fit_pro/presentation/screens/user_info/height/widget/picker_cm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

bool cm = true;
dynamic heightft = 1;
dynamic pointheight = 0;

class WeightPickerInUserInfo extends StatefulWidget {
  const WeightPickerInUserInfo({super.key});

  @override
  State<WeightPickerInUserInfo> createState() =>
      _WeightPickerInProgressScreenState();
}

class _WeightPickerInProgressScreenState extends State<WeightPickerInUserInfo> {
  // int _currentIntValue = 14;
  // int _currentLbValue = 1;
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
        cm
            ? GestureDetector(
                onTap: () {
                  cm = false;
                  setState(() {});
                },
                child: FTorCMcontainerWidget())
            : GestureDetector(
                onTap: () {
                  cm = true;
                  setState(() {});
                },
                child: FTorCMcontainerWidget2()),
        SizedBox(
          height: 20,
        ),
        cm
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
                        value: heightft,
                        minValue: 1,
                        maxValue: 10,
                        itemWidth: double.infinity,
                        step: 1,
                        axis: Axis.vertical,
                        haptics: true,
                        onChanged: (value) => setState(() => heightft = value),
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
                        value: pointheight,
                        minValue: 0,
                        maxValue: 9,
                        itemWidth: double.infinity,
                        step: 1,
                        axis: Axis.vertical,
                        haptics: true,
                        onChanged: (value) =>
                            setState(() => pointheight = value),
                      ),
                    ),
                    // Text('data'),
                  ],
                ),
              )
            : CmPickerWeight()
      ],
    );
  }
}
