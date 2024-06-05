import 'package:fit_pro/presentation/widgets/form_field/formfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpOtpScreen extends StatelessWidget {
  SignUpOtpScreen({super.key});
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Enter the 8-digit code sent to your email.',
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'emailid@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
            ),
            CustomTextFormField(
                suffixIcon: const Icon(
                  Icons.loop,
                  color: Colors.white,
                ),
                labelColor: Colors.white,
                hintTextcolor: Colors.white,
                inputTextcolor: Colors.white,
                labelText: 'Enter 8 digit code',
                hintText: 'Enter 8 digit code',
                controller: otpController),
            Text(
              'Resend Code : 3s',
              style: TextStyle(
                decorationColor: Color.fromARGB(255, 98, 179, 245),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
