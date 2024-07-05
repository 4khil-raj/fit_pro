import 'package:fit_pro/presentation/screens/home/profile/widget/photo_preview.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotosViewProfileScreen extends StatelessWidget {
  PhotosViewProfileScreen({super.key});
  List dummyImages = [
    "assets/images/trending_caro2.jpg",
    "assets/images/week2.1.webp",
    "assets/images/trending_caro2.jpg",
    "assets/images/week2.1.webp",
    "assets/images/trending_caro2.jpg",
    "assets/images/week2.1.webp",
    "assets/images/trending_caro2.jpg",
    "assets/images/week2.1.webp",
    "assets/images/trending_caro2.jpg",
    "assets/images/week2.1.webp",
    "assets/images/trending_caro2.jpg",
    "assets/images/week2.1.webp",
    "assets/images/trending_caro2.jpg",
    "assets/images/week2.1.webp",
    "assets/images/trending_caro2.jpg",
    "assets/images/week2.1.webp",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 81, 37, 114),
        title:
            Text("Scrapbook", style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: dummyImages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 8,
                    childAspectRatio: 4 / 5,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => customNavPush(
                          context,
                          PhotoPreviewScreenProfile(
                            image: dummyImages[index],
                          )),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    dummyImages[index],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
