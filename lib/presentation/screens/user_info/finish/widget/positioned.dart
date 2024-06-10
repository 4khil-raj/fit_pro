import 'package:fit_pro/application/user_info/user_info_bloc.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:fit_pro/presentation/screens/auth/signup/signup.dart';
import 'package:fit_pro/presentation/screens/tempHome/tempHome.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFinishPositioned extends StatelessWidget {
  const CustomFinishPositioned({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let’s go!',
                  style: GoogleFonts.urbanist(
                      color: const Color.fromARGB(255, 72, 173, 255),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'You\'re all set for now. Now go make it happen!',
                  style: GoogleFonts.urbanist(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
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
              onTap: () {
                BlocProvider.of<UserInfoBloc>(context).add(UserInfoEvent());
                customNavRemoveuntil(context, const TempHome());
              },
              textsize: 16,
              width: double.infinity,
              name: 'Finish',
            ),
          ),
          const SizedBox(
            height: 23,
          )
        ],
      ),
    );
  }
}
