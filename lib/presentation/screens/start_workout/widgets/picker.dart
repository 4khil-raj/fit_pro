import 'package:fit_pro/application/reps&weight/repsandweightworkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightAndRepsPickerScreen extends StatefulWidget {
  const WeightAndRepsPickerScreen({super.key, required this.index});
  final int index;
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
                child: Stack(children: [
                  NumberPicker(
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
                    onChanged: (value) {
                      setState(() => _currentIntValue = value);
                      BlocProvider.of<RepsandweightworkoutBloc>(context).add(
                          GetReps(
                              index: widget.index,
                              reps: value,
                              weight: _currentLbValue));
                    },
                  ),
                  // Positioned(
                  // child: Align(
                  //     alignment: Alignment.center, child: Text('reps')))
                ]),
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
                  onChanged: (value) {
                    setState(() => _currentLbValue = value);
                    BlocProvider.of<RepsandweightworkoutBloc>(context).add(
                        GetReps(
                            index: widget.index,
                            reps: _currentIntValue,
                            weight: value));
                  },
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
