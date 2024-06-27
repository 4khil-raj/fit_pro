import 'package:fit_pro/presentation/screens/home/profile/widget/personal_info.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListtileBasicDetails extends StatelessWidget {
  const ListtileBasicDetails(
      {super.key, required this.text1, required this.icon, required this.lock});
  final bool lock;
  final String text1;

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListTile(
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: icon,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: TextStyle(
                  fontSize: 13, color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
      ),
    );
  }
}
// ignore_for_file: prefer_const_constructors

class ContactDetailsProfile extends StatelessWidget {
  const ContactDetailsProfile({super.key});

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
              InkWell(
                onTap: () {
                  customNavPush(context, PersonalInfomatiocEditScreen());
                },
                child: ListtileBasicDetails(
                  lock: true,
                  icon: Icon(Icons.person_2_outlined, color: Colors.white),
                  text1: 'Personal Info',
                ),
              ),
              Divider(
                thickness: .3,
                color: Colors.white,
              ),
              ListtileBasicDetails(
                lock: true,
                icon: Icon(Icons.image_outlined, color: Colors.white),
                text1: 'Photos',
              ),
              Divider(
                thickness: .3,
                color: Colors.white,
              ),
              ListtileBasicDetails(
                lock: true,
                icon: Icon(Icons.book, color: Colors.white),
                text1: 'Subscription',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
