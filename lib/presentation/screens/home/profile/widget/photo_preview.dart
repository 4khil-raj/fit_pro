import 'package:flutter/material.dart';

class PhotoPreviewScreenProfile extends StatelessWidget {
  const PhotoPreviewScreenProfile({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline_rounded))
        ],
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 81, 37, 114),
        // title:
        //     Text("Scrapbook", style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:
                  DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
        ),
      ),
    );
  }
}
