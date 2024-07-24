import 'package:fit_pro/application/user_info/user_info_bloc.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

dynamic currentIntValueAge = 14;

class AgeSelectScreen extends StatefulWidget {
  const AgeSelectScreen({super.key});

  @override
  State<AgeSelectScreen> createState() => _AgeSelectScreenState();
}

class _AgeSelectScreenState extends State<AgeSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text('How old are you?',
              style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 40,
          ),
          Stack(
            children: [
              NumberPicker(
                itemHeight: 100,
                selectedTextStyle: GoogleFonts.urbanist(
                    color: const Color.fromARGB(255, 72, 173, 255),
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
                textStyle: GoogleFonts.urbanist(
                    color: const Color.fromARGB(255, 225, 217, 217),
                    fontSize: 25),
                value: currentIntValueAge,
                minValue: 14,
                maxValue: 100,
                itemWidth: double.infinity,
                step: 1,
                axis: Axis.vertical,
                haptics: true,
                onChanged: (value) =>
                    setState(() => currentIntValueAge = value),
              ),
              Positioned(
                top: 135,
                right: 76,
                child: Text(
                  'Years old',
                  style: GoogleFonts.urbanist(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 72, 173, 255),
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
          const Spacer(),
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
                  BlocProvider.of<UserInfoBloc>(context).add(AgeSelectEvent()),
              textsize: 16,
              width: double.infinity,
              name: 'Next',
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
