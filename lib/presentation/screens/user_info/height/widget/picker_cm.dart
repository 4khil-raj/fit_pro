import 'package:fit_pro/presentation/screens/user_info/height/height.dart';
import 'package:fit_pro/presentation/screens/user_info/height/widget/number_picker_packege.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class CmPickerWeight extends StatefulWidget {
  const CmPickerWeight({super.key});

  @override
  State<CmPickerWeight> createState() => _CmPickerWeightState();
}

class _CmPickerWeightState extends State<CmPickerWeight> {
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
                child: Stack(
                  children: [
                    NumberPicker(
                      itemHeight: 100,
                      selectedTextStyle: GoogleFonts.urbanist(
                        color: const Color.fromARGB(255, 72, 173, 255),
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                      textStyle: GoogleFonts.urbanist(
                        color: const Color.fromARGB(255, 225, 217, 217),
                        fontSize: 25,
                      ),
                      value: heightF,
                      minValue: 30,
                      maxValue: 300,
                      itemWidth: double.infinity,
                      step: 1,
                      axis: Axis.vertical,
                      haptics: true,
                      onChanged: (value) => setState(() => heightF = value),
                    ),
                    // Positioned.fill(
                    //   child: Center(
                    //     child: Text(
                    //       '                Cm',
                    //       style: TextStyle(color: Colors.amber),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

              Flexible(
                  child: CustomNumberPicker(
                itemHeight: 100.0,
                selectedTextStyle: GoogleFonts.urbanist(
                  color: const Color.fromARGB(255, 72, 173, 255),
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
                textStyle: GoogleFonts.urbanist(
                  color: const Color.fromARGB(255, 225, 217, 217),
                  fontSize: 25,
                ),
                value: heightL,
                minValue: 0.0,
                maxValue: 0.5,
                itemWidth: double.infinity,
                step: 0.5,
                axis: Axis.vertical,
                haptics: true,
                onChanged: (value) => setState(() {
                  heightL = value;
                  print(heightL);
                }),
              )),
              // Text('data'),
            ],
          ),
        ),
      ],
    );
  }
}
