import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/material.dart';

class BottomSheetButtons extends StatelessWidget {
  const BottomSheetButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              isNetwork: false,
              isRow: false,
              borderclr: Colors.blueGrey,
              color: const Color.fromARGB(255, 3, 1, 9),
              height: 40,
              fontweight: FontWeight.w500,
              radius: 10,
              textclr: Colors.white,
              name: 'Cancel',
              onTap: () {
                Navigator.pop(context);
              },
              textsize: 20,
              width: MediaQuery.of(context).size.width / 2.5,
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: CustomButton(
              isNetwork: false,
              isRow: false,
              borderclr: Colors.blueGrey,
              color: Colors.yellow[700],
              height: 40,
              fontweight: FontWeight.w500,
              radius: 10,
              textclr: Colors.black,
              name: 'Save',
              onTap: () {
                Navigator.pop(context);
              },
              textsize: 20,
              width: MediaQuery.of(context).size.width / 2.5,
            ),
          ),
        ],
      ),
    );
  }
}
