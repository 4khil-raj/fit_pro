import 'package:fit_pro/presentation/screens/home/profile/widget/personal_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingProfile extends StatefulWidget {
  const SettingProfile({super.key});

  @override
  State<SettingProfile> createState() => _ContactDetailsProfileState();
}

class _ContactDetailsProfileState extends State<SettingProfile> {
  bool switchValue = false;
  bool switchValuedark = false;
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
          padding: EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListtileBasicDetails(
                lock: true,
                icon: Icon(Icons.notifications_none, color: Colors.white),
                text1: 'Workout Reminder',
              ),
              Divider(
                thickness: .3,
                color: Colors.white,
              ),
              ListtileBasicDetails(
                lock: true,
                icon: Icon(Icons.location_on_outlined, color: Colors.white),
                text1: 'Location Services',
              ),
              Divider(
                thickness: .3,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: ListTile(
                  trailing: Switch(
                    value: switchValue,
                    onChanged: (bool value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.wifi_tethering,
                      color: Colors.white,
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Connect to Google Fit",
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
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: ListTile(
                  trailing: Switch(
                    value: switchValuedark,
                    onChanged: (bool value) {
                      setState(() {
                        switchValuedark = value;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      CupertinoIcons.brightness,
                      color: Colors.white,
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dark Mode",
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
              ListtileBasicDetails(
                lock: true,
                icon: Icon(Icons.lock_outline_rounded, color: Colors.white),
                text1: 'Privacy Setting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
