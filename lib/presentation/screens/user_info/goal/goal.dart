import 'package:fit_pro/application/user_info/user_info_bloc.dart';
import 'package:fit_pro/presentation/screens/user_info/goal/widgets/custom_radio.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalSelectScreen extends StatelessWidget {
  const GoalSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SizedBox(
            height: 10,
          ),
          Text(
            'What is your goal',
            style: GoogleFonts.urbanist(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 40,
          ),
          const CustomRadioButtons(),
          Spacer(),
          //ee button ividunn matti custom_radioil akkanam alle aa values kittulla imp
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
                  BlocProvider.of<UserInfoBloc>(context).add(GoalSelectEvent()),
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
