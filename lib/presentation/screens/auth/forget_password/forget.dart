import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/presentation/screens/auth/forget_password/otp_verification.dart';
import 'package:fit_pro/presentation/screens/user_info/collect_userinfo.dart';
import 'package:fit_pro/presentation/widgets/alerts/alerts.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:fit_pro/presentation/widgets/form_field/formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

var verificationId;
final forgetPasswordController = TextEditingController();
void forgetPassword(BuildContext context, bool email) {
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
                          Text(
                            email ? 'Forget Password?' : 'Enter Phonenumber',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          email
                              ? CustomTextFormField(
                                  suffixIcon: const Icon(
                                    Icons.email,
                                    color: Color.fromARGB(255, 239, 234, 234),
                                  ),
                                  labelColor: Colors.white,
                                  labelText: "Email",
                                  hintText: '******@gmail.com',
                                  controller: forgetPasswordController,
                                  hintTextcolor: Colors.white,
                                  inputTextcolor: Colors.white,
                                )
                              : BlocBuilder<AuthBloc, AuthState>(
                                  builder: (context, state) {
                                    if (state is PhoneAuthCodeSentSuccess) {
                                      verificationId = state.verificationId;
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        forgetPasswordOtp(context,
                                            forgetPasswordController.text);
                                        return;
                                      });
                                      BlocProvider.of<AuthBloc>(context)
                                          .add(AuthEvent());
                                    } else if (state is OtpLoadedState) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        customNavPush(context,
                                            UserInfoCollectingScreen());
                                      });
                                    } else if (state is OtpScreenErrorState) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        alerts(context, state.error.toString());
                                        return;
                                      });
                                    }
                                    return IntlPhoneField(
                                      controller: forgetPasswordController,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Phone Number',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(),
                                        ),
                                        prefixIcon: Text('+'),
                                      ),
                                      initialCountryCode: 'IN',
                                      // onChanged: (phone) {
                                      //   // setState(() {
                                      //   //   phonecontroller = phone.completeNumber;
                                      //   // });

                                      //   // forgetPasswordController.text =
                                      //   //     phone.toString();
                                      // },
                                    );
                                  },
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  isNetwork: false,
                                  isRow: false,
                                  borderclr: Colors.blueGrey,
                                  color: const Color.fromARGB(255, 3, 1, 9),
                                  height: 50,
                                  fontweight: FontWeight.w500,
                                  radius: 10,
                                  textclr: Colors.white,
                                  name: 'Cancel',
                                  onTap: () => Navigator.pop(context),
                                  textsize: 20,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                CustomButton(
                                  isNetwork: false,
                                  isRow: false,
                                  borderclr: Colors.blueGrey,
                                  color: Colors.yellow,
                                  height: 50,
                                  fontweight: FontWeight.w500,
                                  radius: 10,
                                  textclr: Colors.black,
                                  name: 'Send OTP',
                                  onTap: () {
                                    email ? emailfn(context) : otp(context);

                                    // // customNavPush(
                                    // //     context, OtpScreenForgetPassword());
                                  },
                                  textsize: 20,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                ),
                              ],
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
                                  color: const Color.fromARGB(255, 11, 49, 81),
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

void otp(context) {
  print(('+91') + (forgetPasswordController.text));
  BlocProvider.of<AuthBloc>(context)
      .add(SendOtpPhoneEvent(phone: ('+91') + (forgetPasswordController.text)));
}

void emailfn(context) {
  {
    Navigator.pop(context);
    forgetPasswordOtp(context, forgetPasswordController.text);
  }
}
