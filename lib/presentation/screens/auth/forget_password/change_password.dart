import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/form_field/formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

final resetPasswordController1 = TextEditingController();
final resetPasswordController2 = TextEditingController();
void changePassword(context) {
  bool obsecure1 = false;
  bool obasecure2 = false;
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
              return LayoutBuilder(builder: (context, constraints) {
                final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
                return AnimatedPadding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                      if (state is ObsecureTextState) {
                        obasecure2 = state.obsecureText;
                        obsecure1 = state.obsecureText;
                      }
                      return Container(
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
                                        Text(
                                          'Reset Password',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 13,
                                        ),
                                        CustomTextFormField(
                                          onTap: () {
                                            BlocProvider.of<AuthBloc>(context)
                                                .add(ObsecureTextEvent(
                                                    obsecure: obsecure1));
                                          },
                                          obscureText: obsecure1,
                                          suffixIcon: const Icon(
                                            Icons.visibility,
                                            color: Color.fromARGB(
                                                255, 243, 238, 238),
                                          ),
                                          labelColor: Colors.white,
                                          labelText: "New Password",
                                          hintText: '******',
                                          controller: resetPasswordController2,
                                          hintTextcolor: Colors.white,
                                          inputTextcolor: Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextFormField(
                                          onTap: () {
                                            BlocProvider.of<AuthBloc>(context)
                                                .add(ObsecureTextEvent(
                                                    obsecure: obasecure2));
                                          },
                                          obscureText: obasecure2,
                                          suffixIcon: const Icon(
                                            Icons.visibility,
                                            color: Color.fromARGB(
                                                255, 243, 238, 238),
                                          ),
                                          labelColor: Colors.white,
                                          labelText: "Confirm New Password",
                                          hintText: '******',
                                          controller: resetPasswordController1,
                                          hintTextcolor: Colors.white,
                                          inputTextcolor: Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(11.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomButton(
                                                isNetwork: false,
                                                isRow: false,
                                                borderclr: Colors.blueGrey,
                                                color: const Color.fromARGB(
                                                    255, 3, 1, 9),
                                                height: 50,
                                                fontweight: FontWeight.w500,
                                                radius: 10,
                                                textclr: Colors.white,
                                                name: 'Cancel',
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                textsize: 20,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
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
                                                name: 'Reset Password',
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                textsize: 18,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
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
                                                  color: const Color.fromARGB(
                                                      255, 11, 49, 81),
                                                  fontSize: 50,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ]))));
                    }));
              });
            });
      });
}
