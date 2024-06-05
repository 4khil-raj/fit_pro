import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/icon_button/icon_button.dart';
import 'package:flutter/material.dart';

class LogInButtons extends StatelessWidget {
  const LogInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            fontweight: FontWeight.w600,
            isNetwork: false,
            isRow: false,
            borderclr: Colors.yellow,
            color: Colors.yellow,
            height: 60,
            radius: 9,
            textclr: Colors.black,
            onTap: () {},
            textsize: 16,
            width: double.infinity,
            name: 'LOG IN',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.all(11.0),
              child: Text(
                'or continue with',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(child: Divider())
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 17,
            right: 17,
            top: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                width: MediaQuery.of(context).size.width / 5,
                radius: 8,
                imagepadding: 6.7,
                image: 'assets/icons/google.png',
                borderclr: Colors.white,
              ),
              CustomIconButton(
                image: 'assets/icons/apple.png',
                imagepadding: 6.7,
                borderclr: Colors.white,
                radius: 8,
                width: MediaQuery.of(context).size.width / 5,
              ),
              CustomIconButton(
                image: 'assets/icons/facebook_logos.png',
                imagepadding: 2,
                borderclr: Colors.white,
                radius: 8,
                width: MediaQuery.of(context).size.width / 5,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
