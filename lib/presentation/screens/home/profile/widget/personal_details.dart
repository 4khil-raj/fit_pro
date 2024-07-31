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
              Padding(
                padding: const EdgeInsets.only(left: 11.0, top: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Notifications',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ListTile(
                  trailing: Text("07:30AM",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 213, 205, 205))),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.alarm,
                      color: Colors.white,
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Workout Reminder",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: .3,
                color: Colors.white,
              ),
              InkWell(
                onTap: () {
                  // customNavPush(context, PersonalInfomatiocEditScreen());
                },
                child: ListtileBasicDetails(
                  lock: true,
                  icon: Icon(Icons.notifications_active_outlined,
                      color: Colors.white),
                  text1: 'Challenge Notification',
                ),
              ),
              Divider(
                thickness: .3,
                color: Colors.white,
              ),
              ListtileBasicDetails(
                lock: true,
                icon: Icon(Icons.warning_amber, color: Colors.white),
                text1: 'Progress Alert',
              ),
              Divider(
                thickness: .3,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ListTile(
                  trailing: Text("10:00PM",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 213, 205, 205))),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.alarm,
                      color: Colors.white,
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Task To-Do Reminder",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 255, 255, 255)),
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
