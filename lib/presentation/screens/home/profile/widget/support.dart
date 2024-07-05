import 'package:fit_pro/presentation/screens/home/profile/widget/personal_details.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: prefer_const_constructors

class SupporButtonsProfile extends StatelessWidget {
  const SupporButtonsProfile({super.key});

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
                  child: Text('Support',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              InkWell(
                onTap: () {
                  // customNavPush(context, PersonalInfomatiocEditScreen());
                },
                child: ListtileBasicDetails(
                  lock: true,
                  icon: Icon(Icons.support_agent, color: Colors.white),
                  text1: 'Support & Queries',
                ),
              ),
              Divider(
                thickness: .3,
                color: Colors.white,
              ),
              ListtileBasicDetails(
                lock: true,
                icon: Icon(Icons.question_answer, color: Colors.white),
                text1: 'FAQ',
              ),
              Divider(
                thickness: .3,
                color: Colors.white,
              ),
              ListtileBasicDetails(
                lock: true,
                icon: Icon(Icons.tour, color: Colors.white),
                text1: 'App Tour',
              ),
              Divider(
                thickness: .3,
                color: Colors.white,
              ),
              ListtileBasicDetails(
                lock: true,
                icon: Icon(Icons.privacy_tip, color: Colors.white),
                text1: 'Privacy Policy',
              ),
              Divider(
                thickness: .3,
                color: Colors.white,
              ),
              ListtileBasicDetails(
                lock: true,
                icon:
                    Icon(Icons.settings_suggest_outlined, color: Colors.white),
                text1: ' Suggest a Feature',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
