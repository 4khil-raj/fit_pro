import 'package:fit_pro/application/user_fetch/userfetch_bloc.dart';
import 'package:fit_pro/infrastructure/repository/facebook/repo.dart';
import 'package:fit_pro/presentation/screens/home/profile/profile.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 131, 59, 186),
          height: statusBarHeight,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              SizedBox(
                width: 7,
              ),
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: SizedBox(
              //       height: 50,
              //       child: TextFormField(
              //         decoration: InputDecoration(
              //             border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(40)),
              //             hintText: "Search workouts",
              //             hintStyle: const TextStyle(color: Colors.grey),
              //             // suffixIcon: Icon(Icons.search),
              //             prefixIcon: const Icon(Icons.search)),
              //       ),
              //     ),
              //   ),
              // ),
              Text(
                "BEAST MODE",
                style: GoogleFonts.josefinSans(
                    color: Colors.amber,
                    fontWeight: FontWeight.w800,
                    fontSize: 25),
              ),
              Spacer(),

              const SizedBox(
                  width:
                      10), // Add some spacing between the search bar and avatar
              GestureDetector(
                // onTap: () => FaceBookAuthRepo().signInWithFacebook(),
                onTap: () => customNavPush(context, const ProfileScreen()),
                child: BlocBuilder<UserfetchBloc, UserfetchState>(
                  builder: (context, state) {
                    if (state is UserFetched) {
                      return CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          state.usermodel.user?.profilePic ??
                              'https://www.creativefabrica.com/wp-content/uploads/2021/09/09/User-avatar-profile-icon-Graphics-17068385-1.jpg',
                        ),
                      );
                    }
                    return const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        "https://www.creativefabrica.com/wp-content/uploads/2021/09/09/User-avatar-profile-icon-Graphics-17068385-1.jpg",
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              // CarouselSliderDemo()
            ],
          ),
        ),
      ],
    );
  }
}
