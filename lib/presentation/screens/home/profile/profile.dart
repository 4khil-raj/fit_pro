// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fit_pro/presentation/screens/home/profile/widget/account.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/media.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/password.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/personal_details.dart';
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
              Container(
                color: Color.fromARGB(255, 53, 53, 53),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2F2d%2F00%2F35%2F2d003500486fc421f3497197689a7e06.jpg&f=1&nofb=1&ipt=9fad4b1450c71582ea96205d0b52c75334c0af16c8f6219e2c802ea4bcb57505&ipo=images",
                        ),
                        radius: 50,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Balam Rawat",
                          style: GoogleFonts.rubik(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        Text(
                          "38 Yrs . Male",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 211, 202, 202)),
                        ),
                        Text(
                          "Heignt: 6\'1\" . Weight: 93kg",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 211, 202, 202)),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
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
