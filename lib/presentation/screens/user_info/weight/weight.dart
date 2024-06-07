import 'package:fit_pro/application/user_info/user_info_bloc.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightCollectScreen extends StatefulWidget {
  const WeightCollectScreen({super.key});

  @override
  State<WeightCollectScreen> createState() => _WeightCollectScreenState();
}

class _WeightCollectScreenState extends State<WeightCollectScreen> {
  final double min = 0;
  final double max = 100;
  String selectedValue = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35,
            ),
            Text(
              'What is your Weight?',
              style: GoogleFonts.urbanist(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            Spacer(),
            AnimatedWeightPicker(
              showSuffix: true,
              selectedValueColor: Colors.blue,
              // majorIntervalTextColor: Colors.blue,
              suffixTextColor: Colors.blue,
              dialColor: Colors.blue,
              min: min,
              max: max,
              onChange: (newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: CustomButton(
                fontweight: FontWeight.w600,
                isNetwork: false,
                isRow: false,
                borderclr: Colors.yellow,
                color: Colors.yellow,
                height: 60,
                radius: 9,
                textclr: Colors.black,
                onTap: () => BlocProvider.of<UserInfoBloc>(context)
                    .add(WeightSelectEvent()),
                textsize: 16,
                width: double.infinity,
                name: 'Next',
              ),
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
