import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/presentation/screens/auth/forget_password/forget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberMeLogIn extends StatelessWidget {
  const RememberMeLogIn({super.key, required this.remember});
  final bool remember;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              BlocProvider.of<AuthBloc>(context)
                  .add(RememberMeEvent(remember: remember));
            },
            child: Container(
              height: 17,
              width: 17,
              decoration: BoxDecoration(
                color: remember ? Colors.blue : Colors.transparent,
                image: remember
                    ? const DecorationImage(
                        image: AssetImage('assets/icons/tickIcon.png'))
                    : null,
                border: Border.all(color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Remember Me',
            style: TextStyle(color: Colors.white),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => forgetPassword(context),
            child: const Text(
              'Forget Password ?',
              style: TextStyle(
                  decorationColor: Color.fromARGB(255, 98, 179, 245),
                  color: Color.fromARGB(255, 224, 215, 215),
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
