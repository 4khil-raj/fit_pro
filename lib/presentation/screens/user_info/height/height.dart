// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fit_pro/application/user_info/user_info_bloc.dart';
import 'package:fit_pro/presentation/screens/user_info/height/widget/picker.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ruler_scale_picker/ruler_scale_picker.dart';

dynamic heightF = 30;
dynamic heightL = 0.0;

class HeightSelectScreen extends StatelessWidget {
  const HeightSelectScreen({super.key, required this.values});
  final int values;
  // int values = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35,
        ),
        Text(
          'What is your Height?',
          style: GoogleFonts.urbanist(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        Stack(children: [WeightPickerInUserInfo()]),
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
            onTap: () =>
                BlocProvider.of<UserInfoBloc>(context).add(HeightSelectEvent()),
            textsize: 16,
            width: double.infinity,
            name: 'Next',
          ),
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
