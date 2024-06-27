import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void taskViewSheet(BuildContext context, youtubePlayerController) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.6,
        maxChildSize: 0.8,
        expand: false,
        builder: (context, scrollController) {
          return LayoutBuilder(
            builder: (context, constraints) {
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 170, right: 170, top: 8, bottom: 8),
                            child: Divider(
                              thickness: 4,
                            ),
                          ),
                          YoutubePlayer(
                            controller: youtubePlayerController,
                            showVideoProgressIndicator: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Lateral Burpee",
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 239, 236, 236)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "4 Sets | 25 sec",
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 195, 185, 185)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Kneel on the floor and put your hands on the floor in front of you. Keep your hands shoulder-width apart and your knees directly below your hips.Inhale deeply while curving your lower back and bringing your head up..... see more",
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 239, 236, 236)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}

// void otp(context) {
//   print(('+91') + (forgetPasswordController.text));
//   BlocProvider.of<AuthBloc>(context)
//       .add(SendOtpPhoneEvent(phone: ('+91') + (forgetPasswordController.text)));
// }

// void emailfn(context) {
//   {
//     Navigator.pop(context);
//     forgetPasswordOtp(context, forgetPasswordController.text);
//   }
// }
