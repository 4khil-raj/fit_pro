import 'package:fit_pro/presentation/screens/home/profile/widget/personal_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionAndBillingScreen extends StatelessWidget {
  const SubscriptionAndBillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 53, 53, 53),
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
                  child: Text('Subscription & Billing',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: ListTile(
                  trailing: Icon(Icons.check_circle, color: Colors.green),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.verified,
                      color: Colors.white,
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Subscription Status",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: .3,
                color: Colors.white,
              ),
              InkWell(
                onTap: () {
                  // customNavPush(context, PersonalInfomatiocEditScreen());
                },
                child: const ListtileBasicDetails(
                  lock: true,
                  icon: Icon(Icons.security_update_good_sharp,
                      color: Colors.white),
                  text1: 'Upgrade/Downgrade',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
