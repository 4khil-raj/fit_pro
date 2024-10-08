import 'package:fit_pro/application/user_info/user_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

dynamic gender;

class CustomGenderButtons extends StatefulWidget {
  const CustomGenderButtons({super.key});

  @override
  State<CustomGenderButtons> createState() => _CustomGenderButtonsState();
}

class _CustomGenderButtonsState extends State<CustomGenderButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            gender = "Male";
            BlocProvider.of<UserInfoBloc>(context).add(GenderSelectEvent());
          }),
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100)),
            child: const Icon(
              Icons.male,
              size: 65,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text('Male',
            style: GoogleFonts.urbanist(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 25,
        ),
        GestureDetector(
          onTap: () => setState(() {
            gender = 'Female';
            BlocProvider.of<UserInfoBloc>(context).add(GenderSelectEvent());
          }),
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100)),
            child: const Icon(
              Icons.female,
              size: 65,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text('Female',
            style: GoogleFonts.urbanist(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
      ],
    );
  }
}
