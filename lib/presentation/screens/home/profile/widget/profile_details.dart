import 'package:fit_pro/application/user_fetch/userfetch_bloc.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/personal_info.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key, required this.state});
  final UserFetched state;
  @override
  Widget build(BuildContext context) {
    print(state.usermodel.user?.height.value);
    return Container(
      color: const Color.fromARGB(255, 53, 53, 53),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                state.usermodel.user?.profilePic ??
                    "https://cdn.pixabay.com/photo/2020/07/14/13/07/icon-5404125_1280.png",
              ),
              radius: 50,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.usermodel.user?.name == ""
                    ? "User"
                    : state.usermodel.user!.name,
                style: GoogleFonts.rubik(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 255, 255, 255)),
              ),
              Text(
                "${state.usermodel.user?.age.toString()} Yrs . ${state.usermodel.user?.gender}",
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 211, 202, 202)),
              ),
              Text(
                "Heignt: ${state.usermodel.user?.height.value} . Weight: ${state.usermodel.user?.weight.value}${state.usermodel.user?.weight.unit}",
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 211, 202, 202)),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {
                  customNavPush(context, PersonalInfomatiocEditScreen());
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
