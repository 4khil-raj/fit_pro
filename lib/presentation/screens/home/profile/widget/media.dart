import 'package:fit_pro/presentation/screens/home/profile/widget/personal_details.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/personal_info.dart';
import 'package:fit_pro/presentation/screens/home/profile/widget/photos_gallery.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: prefer_const_constructors

class MediaProfileCustomListView extends StatelessWidget {
  const MediaProfileCustomListView({super.key});

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
                  child: Text('Media',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              InkWell(
                onTap: () =>
                    customNavPush(context, PhotosGalleryProfileScreen()),
                child: ListtileBasicDetails(
                  lock: true,
                  icon: Icon(Icons.photo_outlined, color: Colors.white),
                  text1: 'Photos',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
