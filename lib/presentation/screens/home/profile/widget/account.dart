import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/personal_details.dart';
import 'package:fit_pro/presentation/screens/welcomeScreen/welcome.dart';
import 'package:fit_pro/presentation/widgets/alerts/alerts.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: prefer_const_constructors

class AccountButtonsProfile extends StatelessWidget {
  const AccountButtonsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 53, 53, 53),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 11.0, top: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Account',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     // customNavPush(context, PersonalInfomatiocEditScreen());
              //   },
              //   child: ListtileBasicDetails(
              //     lock: true,
              //     icon: Icon(Icons.key, color: Colors.white),
              //     text1: 'Lo',
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: ListTile(
                  onTap: () => alertsWithButtons(
                    context,
                    'Are you sure want to logout?',
                    () {
                      clearLoginInfo();
                      customNavRemoveuntil(context, WelcomeScreen());
                    },
                  ),
                  trailing: Icon(Icons.logout, color: Colors.red),
                  // leading: CircleAvatar(
                  //   backgroundColor: Colors.transparent,
                  //   child: Icon(
                  //     Icons.verified,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Logout",
                        style: TextStyle(fontSize: 13, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: .3,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: ListTile(
                  trailing: Icon(CupertinoIcons.delete, color: Colors.red),
                  // leading: CircleAvatar(
                  //   backgroundColor: Colors.transparent,
                  //   child: Icon(
                  //     Icons.verified,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delete Account",
                        style: TextStyle(fontSize: 13, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
