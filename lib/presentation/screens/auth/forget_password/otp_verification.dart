import 'package:fit_pro/presentation/screens/auth/forget_password/change_password.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

final forgetOtpController = TextEditingController();
void forgetPasswordOtp(context) {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(234, 239, 243, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFE8E6EA)),
      borderRadius: BorderRadius.circular(15),
    ),
  );
  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(
      color: Colors.blue,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: Colors.transparent,
    ),
  );
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
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 170, right: 170, top: 8, bottom: 8),
                            child: Divider(
                              thickness: 4,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'OTP Verification',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'We sent the code to ',
                                    style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 239, 234, 234),
                                        fontSize: 14),
                                  ),
                                  Text(
                                    'akhil.gmail.com',
                                    style: GoogleFonts.poppins(
                                        color: Colors.blue, fontSize: 14),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //otp formfield
                          Align(
                            alignment: Alignment.center,
                            child: Pinput(
                              controller: forgetOtpController,
                              length: 4,
                              defaultPinTheme: defaultPinTheme,
                              focusedPinTheme: focusedPinTheme,
                              submittedPinTheme: submittedPinTheme,
                              showCursor: true,
                            ),
                          ),
                          //
                          const SizedBox(
                            height: 13,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Resend OTP',
                              style: TextStyle(
                                fontSize: 15,
                                decorationColor:
                                    Color.fromARGB(255, 98, 179, 245),
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: CustomButton(
                              isNetwork: false,
                              isRow: false,
                              borderclr: Colors.blueGrey,
                              color: Colors.yellow,
                              height: 50,
                              fontweight: FontWeight.w500,
                              radius: 10,
                              textclr: Colors.black,
                              name: 'Verify OTP',
                              onTap: () {
                                Navigator.pop(context);
                                changePassword(context);
                              },
                              textsize: 20,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'FitPro',
                              style: GoogleFonts.orbitron(
                                  color: Color.fromARGB(255, 11, 49, 81),
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
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
