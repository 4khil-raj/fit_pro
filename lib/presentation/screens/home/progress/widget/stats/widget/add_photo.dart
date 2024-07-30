import 'package:fit_pro/application/image_pic/imagepicker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void addImage(context, bool profile) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.4,
            maxChildSize: 0.4,
            expand: false,
            builder: (context, scrollController) {
              return LayoutBuilder(builder: (context, constraints) {
                final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
                return AnimatedPadding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 9, 3, 28),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SingleChildScrollView(
                                controller: scrollController,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 170,
                                            right: 170,
                                            top: 8,
                                            bottom: 8),
                                        child: Divider(
                                          thickness: 4,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          "Upload Image",
                                          style: GoogleFonts.poppins(
                                              fontSize: 21,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          Navigator.pop(context);
                                          BlocProvider.of<ImagepickerBloc>(
                                                  context)
                                              .add(ImageFromCamera());
                                        },
                                        title: Text(
                                          "  Camera",
                                          style: GoogleFonts.rubik(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.white,
                                        ),
                                        leading: const Icon(
                                            Icons.camera_alt_outlined,
                                            size: 25,
                                            color: Color.fromARGB(
                                                255, 100, 185, 255)),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          Navigator.pop(context);
                                          BlocProvider.of<ImagepickerBloc>(
                                                  context)
                                              .add(ImageFromGallery());
                                        },
                                        title: Text(
                                          "  App Gallery",
                                          style: GoogleFonts.rubik(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.white,
                                        ),
                                        leading: const Icon(
                                            Icons.photo_filter_outlined,
                                            size: 25,
                                            color: Color.fromARGB(
                                                255, 100, 185, 255)),
                                      ),
                                      profile
                                          ? SizedBox()
                                          : ListTile(
                                              title: Text(
                                                "  Photo Gallery",
                                                style: GoogleFonts.rubik(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                              trailing: const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.white,
                                              ),
                                              leading: const Icon(
                                                  Icons.photo_outlined,
                                                  size: 25,
                                                  color: Color.fromARGB(
                                                      255, 100, 185, 255)),
                                            )
                                    ])))));
              });
            });
      });
}
