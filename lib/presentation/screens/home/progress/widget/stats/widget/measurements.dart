import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MeasurementsWidgetProgressScreen extends StatelessWidget {
  const MeasurementsWidgetProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "Measurements",
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  "+ Add Body Part",
                  style: TextStyle(color: Color.fromARGB(255, 80, 172, 248)),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 53, 53, 53),
                borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) => Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          trailing: Text(
                            "75 kg",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          title: Text(
                            "Weight",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Color.fromARGB(255, 218, 213, 213)),
                          ),
                          leading: Container(
                            // width: 0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                // image: DecorationImage(
                                //   image: NetworkImage(
                                //       "https://media1.popsugar-assets.com/files/thumbor/sd8OUeJIrd0Uvrp-tsIdhyM-zEw/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2019/03/22/924/n/1922729/tmp_iaeKyg_9488e8e7b34d3d1a_GettyImages-1060817952.jpg"),
                                // ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Image.network(
                                  "https://media1.popsugar-assets.com/files/thumbor/sd8OUeJIrd0Uvrp-tsIdhyM-zEw/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2019/03/22/924/n/1922729/tmp_iaeKyg_9488e8e7b34d3d1a_GettyImages-1060817952.jpg"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
