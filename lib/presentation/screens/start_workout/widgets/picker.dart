import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightAndRepsPickerScreen extends StatefulWidget {
  const WeightAndRepsPickerScreen({super.key});

  @override
  State<WeightAndRepsPickerScreen> createState() =>
      _WeightAndRepsPickerScreenState();
}

class _WeightAndRepsPickerScreenState extends State<WeightAndRepsPickerScreen> {
  int _currentIntValue = 1;
  int _currentLbValue = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: NumberPicker(
                  itemHeight: 80,
                  selectedTextStyle: GoogleFonts.urbanist(
                      color: const Color.fromARGB(255, 72, 173, 255),
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                  textStyle: GoogleFonts.urbanist(
                      color: const Color.fromARGB(255, 225, 217, 217),
                      fontSize: 25),
                  value: _currentIntValue,
                  minValue: 1,
                  maxValue: 200,
                  itemWidth: double.infinity,
                  step: 1,
                  axis: Axis.vertical,
                  haptics: true,
                  onChanged: (value) =>
                      setState(() => _currentIntValue = value),
                ),
              ),
              Flexible(
                child: NumberPicker(
                  itemHeight: 80,
                  selectedTextStyle: GoogleFonts.urbanist(
                      color: const Color.fromARGB(255, 72, 173, 255),
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                  textStyle: GoogleFonts.urbanist(
                      color: const Color.fromARGB(255, 225, 217, 217),
                      fontSize: 25),
                  value: _currentLbValue,
                  minValue: 0,
                  maxValue: 100,
                  itemWidth: double.infinity,
                  step: 1,
                  axis: Axis.vertical,
                  haptics: true,
                  onChanged: (value) => setState(() => _currentLbValue = value),
                ),
              ),
              // Text('data'),
            ],
          ),
        ),
        // Spacer(),
        const Positioned(
            // top: 2,
            // bottom: 1,
            // left: 1,
            child: SizedBox(
          height: 180,
          child: Column(
            children: [
              SizedBox(
                height: 84,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Divider(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Divider(),
                      )
                    ],
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Divider(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Divider(),
                      )
                    ],
                  ))
                ],
              ),
            ],
          ),
        ))
      ],
    );
  }
}
