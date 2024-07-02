import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/add_photo.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/dotted_container/dotted.dart';
import 'package:fit_pro/presentation/widgets/form_field/formfield2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProgressScreenBodyTrasformation extends StatelessWidget {
  AddProgressScreenBodyTrasformation({super.key});
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 53, 53, 53),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Add Progress",
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text(
                "Add Details",
                style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            CustomTextFormField2(
                labelColor: Colors.white,
                labelText: "Enter Date",
                hintText: "dd/mm/yyyy",
                hintTextcolor: Colors.white,
                inputTextcolor: Colors.white,
                controller: dateController,
                label: "label"),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomPaint(
                  painter: DottedBorderPainter(
                    color: const Color.fromARGB(255, 123, 191, 246),
                    strokeWidth: 2.0,
                    dashLength: 10.0,
                    spaceLength: 3.0,
                  ),
                  child: InkWell(
                    onTap: () => addImage(context),
                    child: Container(
                      // width: 200,
                      height: 230,
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            size: 35,
                            color: Color.fromARGB(255, 80, 168, 240),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            " Add an image",
                            style: TextStyle(
                                color: Color.fromARGB(255, 208, 202, 202)),
                          ),
                          Text(
                            " Supports png,jpeg",
                            style: TextStyle(
                                color: Color.fromARGB(255, 208, 202, 202)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
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
                      name: "Cancel",
                      radius: 10,
                      onTap: () {},
                      textclr: Colors.white,
                    ),
                  ),
                  const SizedBox(
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
                      name: "Save",
                      radius: 10,
                      onTap: () {},
                      textclr: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
