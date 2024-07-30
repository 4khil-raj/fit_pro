import 'package:fit_pro/application/user_fetch/userfetch_bloc.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/account.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/media.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/password.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/personal_details.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/profile_details.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/subscription.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 81, 37, 114),
        title: Text("Profile",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 3,
              ),
              BlocBuilder<UserfetchBloc, UserfetchState>(
                builder: (context, state) {
                  if (state is UserFetched) {
                    return ProfileDetailsScreen(
                      state: state,
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              // ProfileSqureContainer(),
              const MediaProfileCustomListView(),
              const ContactDetailsProfile(),
              const SubscriptionAndBillingScreen(),
              const SupporButtonsProfile(),
              const PasswordButtonsProfile(),
              const AccountButtonsProfile()
            ],
          ),
        ),
      ),
    );
  }
}
