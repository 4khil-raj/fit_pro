import 'package:fit_pro/presentation/screens/home/profile/widget/personal_details.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/settings.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/squre_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 81, 37, 114),
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.white)),
              child: TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  Colors.transparent,
                )),
                onPressed: () {},
                label: const Text(
                  "Premium",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                icon: FaIcon(
                  FontAwesomeIcons.fire,
                  color: Colors.white,
                  size: 19.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2F2d%2F00%2F35%2F2d003500486fc421f3497197689a7e06.jpg&f=1&nofb=1&ipt=9fad4b1450c71582ea96205d0b52c75334c0af16c8f6219e2c802ea4bcb57505&ipo=images",
                ),
                radius: 60,
              ),
              Text(
                "Balam Rawat",
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileSqureContainer(),
              Padding(
                padding: const EdgeInsets.only(left: 11.0, top: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Contact Details',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              ContactDetailsProfile(),
              Padding(
                padding: const EdgeInsets.only(left: 11.0, top: 10, bottom: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Settings',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              SettingProfile()
            ],
          ),
        ),
      ),
    );
  }
}
