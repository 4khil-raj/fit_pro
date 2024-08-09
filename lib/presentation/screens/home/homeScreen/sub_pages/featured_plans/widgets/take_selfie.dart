import 'dart:io';

import 'package:fit_pro/application/image_pic/imagepicker_bloc.dart';
import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/add_photo.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TakeSelfieScreen extends StatelessWidget {
  const TakeSelfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ImagepickerBloc>(context).add(ImagepickerEvent());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Take Selfie',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () => addImage(context, false),
                child: Container(
                  height: 370,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 48, 48, 48),
                  child: BlocBuilder<ImagepickerBloc, ImagepickerState>(
                    builder: (context, state) {
                      if (state is ImageSelected) {
                        return Container(
                          height: 370,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(state.image.path)))),
                        );
                      }
                      return Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ),
              // Container(
              //   height: 70,
              //   color: Color.fromARGB(136, 40, 40, 40),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(left: 10.0),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               'Take Selfie',
              //               style: GoogleFonts.poppins(color: Colors.white),
              //             ),
              //             Text(
              //               'Take Selfie',
              //               style: GoogleFonts.poppins(color: Colors.white),
              //             )
              //           ],
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(right: 10.0),
              //         child: Icon(
              //           Icons.check_circle,
              //           size: 35,
              //           color: Color.fromARGB(255, 0, 187, 255),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 52, 52, 52),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.fire,
                                color: Color.fromARGB(255, 85, 177, 252),
                                size: 25.0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 13.0, bottom: 5),
                                child: Text(
                                  '75',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                'Calories',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: const Color.fromARGB(
                                        255, 188, 186, 186)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 52, 52, 52),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.dumbbell,
                                    color: Color.fromARGB(255, 85, 177, 252),
                                    size: 25.0,
                                  ),
                                  Text(
                                    '75',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Exercise',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 188, 186, 186)),
                                  ),
                                ],
                              ),
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 52, 52, 52),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.stopwatch,
                                      color: Color.fromARGB(255, 85, 177, 252),
                                      size: 25.0,
                                    ),
                                    Text(
                                      '1',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'Minutes',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 188, 186, 186)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        isNetwork: false,
                        isRow: false,
                        color: Color.fromARGB(255, 77, 76, 76),
                        borderclr: Color.fromARGB(255, 77, 76, 76),
                        fontweight: FontWeight.w700,
                        height: 50,
                        name: "Share",
                        radius: 10,
                        textclr: Colors.white,
                        textsize: 14,
                        onTap: () async {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomButton(
                        isNetwork: false,
                        isRow: false,
                        color: Colors.amber[300],
                        borderclr: Colors.amber[300],
                        fontweight: FontWeight.w700,
                        height: 50,
                        name: "Save",
                        radius: 10,
                        textclr: Colors.black,
                        textsize: 14,
                        onTap: () async {
                          // customNavRemoveuntil(context, const BottomNavBar());
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
