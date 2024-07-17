import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

dynamic currentlyWorkout;

class CurrentlyWorkoutRadioButtons extends StatefulWidget {
  const CurrentlyWorkoutRadioButtons({super.key});

  @override
  State<CurrentlyWorkoutRadioButtons> createState() =>
      _CurrentlyWorkoutRadioButtonsState();
}

class _CurrentlyWorkoutRadioButtonsState
    extends State<CurrentlyWorkoutRadioButtons> {
  bool remember1 = false;
  bool remember2 = false;
  bool remember3 = false;
  // dynamic selectedOption1;
  // dynamic selectedOption2;
  // dynamic selectedOption3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 35, right: 35),
          child: InkWell(
            onTap: () {
              setState(() {
                remember1 = true;
                remember2 = false;
                remember3 = false;
                currentlyWorkout = 'Commercial Gym';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)),
              child: ListTile(
                title: Text(
                  'Commercial Gym',
                  style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                leading: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      color: remember1 ? Colors.blue : Colors.transparent,
                      image: remember1
                          ? const DecorationImage(
                              image: AssetImage('assets/icons/tickIcon.png'))
                          : null,
                      border: Border.all(
                          width: 2,
                          color: remember1 ? Colors.transparent : Colors.white),
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
            ),
          ),
        ),

        //
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 35, right: 35),
          child: InkWell(
            onTap: () {
              setState(() {
                remember2 = true;
                remember1 = false;
                remember3 = false;
                currentlyWorkout = 'Home Gym';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)),
              child: ListTile(
                title: Text(
                  'Home Gym',
                  style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                leading: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      color: remember2 ? Colors.blue : Colors.transparent,
                      image: remember2
                          ? const DecorationImage(
                              image: AssetImage('assets/icons/tickIcon.png'))
                          : null,
                      border: Border.all(
                          width: 2,
                          color: remember2 ? Colors.transparent : Colors.white),
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
            ),
          ),
        ),

        //
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 35, right: 35),
          child: InkWell(
            onTap: () {
              setState(() {
                remember3 = true;
                remember1 = false;
                remember2 = false;
                currentlyWorkout = 'Body Weight';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)),
              child: ListTile(
                title: Text(
                  'Body Weight',
                  style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                leading: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      color: remember3 ? Colors.blue : Colors.transparent,
                      image: remember3
                          ? const DecorationImage(
                              image: AssetImage('assets/icons/tickIcon.png'))
                          : null,
                      border: Border.all(
                          width: 2,
                          color: remember3 ? Colors.transparent : Colors.white),
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
            ),
          ),
        ),
        // const Spacer(),
        // SizedBox(
        //   height: 100,
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(13.0),
        //   child: CustomButton(
        //     fontweight: FontWeight.w600,
        //     isNetwork: false,
        //     isRow: false,
        //     borderclr: Colors.yellow,
        //     color: Colors.yellow,
        //     height: 60,
        //     radius: 9,
        //     textclr: Colors.black,
        //     onTap: () {},
        //     // BlocProvider.of<UserInfoBloc>(context).add(AgeSelectEvent()),
        //     textsize: 16,
        //     width: double.infinity,
        //     name: 'Next',
        //   ),
        // ),
        // const SizedBox(
        //   height: 20,
        // )
      ],
    );
  }
}
