import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/application/login_bloc/login_bloc.dart';
import 'package:fit_pro/domain/validations/textfields.dart';
import 'package:fit_pro/presentation/widgets/form_field/formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginFields extends StatelessWidget {
  const LoginFields(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.obsecure});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obsecure;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'FitPro',
          style: GoogleFonts.orbitron(
              color: const Color.fromARGB(255, 72, 173, 255),
              fontSize: 50,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 35,
        ),
        CustomTextFormField(
          validator: Validations.validateEmail,
          suffixIcon: const Icon(
            Icons.email,
            color: Color.fromARGB(255, 239, 234, 234),
          ),
          labelColor: Colors.white,
          labelText: "Email",
          hintText: '******@gmail.com',
          controller: emailController,
          hintTextcolor: Colors.white,
          inputTextcolor: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextFormField(
          onTap: () {
            BlocProvider.of<AuthBloc>(context)
                .add(ObsecureTextEvent(obsecure: obsecure));
          },
          obscureText: obsecure,
          suffixIcon: const Icon(
            Icons.visibility,
            color: Color.fromARGB(255, 243, 238, 238),
          ),
          labelColor: Colors.white,
          validator: Validations.validateCreatepassword,
          labelText: "Password",
          hintText: '******',
          controller: passwordController,
          hintTextcolor: Colors.white,
          inputTextcolor: Colors.white,
        ),
      ],
    );
  }
}
