import 'package:fit_pro/presentation/screens/home/profile/widget/personal_info.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
              ),
              Text(
                "38 Yrs . Male",
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 211, 202, 202)),
              ),
              Text(
                "Heignt: 6\'1\" . Weight: 93kg",
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 211, 202, 202)),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {
                  customNavPush(context, PersonalInfomatiocEditScreen());
                },
                icon: Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
