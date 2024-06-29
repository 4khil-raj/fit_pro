// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fit_pro/presentation/screens/home/profile/widget/account.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/media.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/password.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/personal_details.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/profile_details.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/settings.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/subscription.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/support.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 81, 37, 114),
        title: Text("Profile",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w600)),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Container(
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(40),
        //           border: Border.all(color: Colors.white)),
        //       child: TextButton.icon(
        //         style: ButtonStyle(
        //             backgroundColor: MaterialStateProperty.all(
        //           Colors.transparent,
        //         )),
        //         onPressed: () {},
        //         label: const Text(
        //           "Premium",
        //           style: TextStyle(
        //               fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)),
        //         ),
        //         icon: FaIcon(
        //           FontAwesomeIcons.fire,
        //           color: Colors.white,
        //           size: 19.0,
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 3,
              ),
              ProfileDetailsScreen(),
              SizedBox(
                height: 10,
              ),
              // ProfileSqureContainer(),
              MediaProfileCustomListView(),
              ContactDetailsProfile(),
              SubscriptionAndBillingScreen(),
              SupporButtonsProfile(),
              PasswordButtonsProfile(), AccountButtonsProfile()
            ],
          ),
        ),
      ),
    );
  }
}
