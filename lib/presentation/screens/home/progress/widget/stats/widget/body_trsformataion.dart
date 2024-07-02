import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/add_progress.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/body_trasfo_card.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/scale_painter.dart';
import 'package:fit_pro/presentation/widgets/alerts/alerts.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyTrasformationScreen extends StatelessWidget {
  const BodyTrasformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 53, 53, 53),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Body Trasformation",
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            BodyTrsformationCarouselPage(),
            Container(
              height: 90,
              width: double.infinity,
              child: CustomPaint(
                painter: ScalePainter(),
              ),
            ),
            Text(
              "24 MAY, 2024",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomButton(
                    isNetwork: false,
                    isRow: false,
                    borderclr: Colors.transparent,
                    color: const Color.fromARGB(255, 93, 93, 93),
                    height: 40,
                    fontweight: FontWeight.w600,
                    textsize: 15,
                    name: "Delete Card",
                    radius: 10,
                    onTap: () => alertsWithButtons(
                        context, "Are you sure you want to Delete this Photo?",
                        () {
                      Navigator.pop(context);
                    }),
                    textclr: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomButton(
                    isNetwork: false,
                    isRow: false,
                    borderclr: Colors.transparent,
                    color: Colors.yellow,
                    height: 40,
                    fontweight: FontWeight.w600,
                    textsize: 15,
                    name: "Add Progress",
                    radius: 10,
                    onTap: () => customNavPush(
                        context, AddProgressScreenBodyTrasformation()),
                    textclr: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
