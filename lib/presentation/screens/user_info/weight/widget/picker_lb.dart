import 'package:fit_pro/presentation/screens/user_info/weight/weight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class LbPickerWeight extends StatefulWidget {
  const LbPickerWeight({super.key});

  @override
  State<LbPickerWeight> createState() => _CmPickerWeightState();
}

class _CmPickerWeightState extends State<LbPickerWeight> {
  int _currentIntValue = 1;
  int _currentLbValue = 0;
  // bool cm = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 21.0, top: 8, bottom: 8),
        //   child: Text(
        //     "Weight",
        //     style: TextStyle(

        Padding(
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
                  value: weightF,
                  minValue: 1,
                  maxValue: 450,
                  itemWidth: double.infinity,
                  step: 1,
                  axis: Axis.vertical,
                  haptics: true,
                  onChanged: (value) => setState(() => weightF = value),
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
                  value: weightL,
                  minValue: 0,
                  maxValue: 15,
                  itemWidth: double.infinity,
                  step: 1,
                  axis: Axis.vertical,
                  haptics: true,
                  onChanged: (value) => setState(() => weightL = value),
                ),
              ),
              // Text('data'),
            ],
          ),
        ),
      ],
    );
  }
}
