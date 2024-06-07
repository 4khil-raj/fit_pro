import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DaysWorkoutButtons extends StatefulWidget {
  const DaysWorkoutButtons({super.key});

  @override
  State<DaysWorkoutButtons> createState() => _DaysWorkoutButtonsState();
}

class _DaysWorkoutButtonsState extends State<DaysWorkoutButtons> {
  bool remember1 = false;
  bool remember2 = false;
  bool remember3 = false;
  bool remember4 = false;
  dynamic selectedOption1;
  dynamic selectedOption2;
  dynamic selectedOption3;
  dynamic selectedOption4;
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
                selectedOption1 = '3 days / week';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)),
              child: ListTile(
                title: Text(
                  '3 days / week',
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
                selectedOption2 = '4 days / week';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)),
              child: ListTile(
                title: Text(
                  '4 days / week',
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
                selectedOption2 = '5 days / week';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)),
              child: ListTile(
                title: Text(
                  '5 days / week',
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
                selectedOption3 = '6 days / week';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)),
              child: ListTile(
                title: Text(
                  '6 days / week',
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
      ],
    );
  }
}
