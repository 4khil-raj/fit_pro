import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/form_field/formfield2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfomatiocEditScreen extends StatelessWidget {
  PersonalInfomatiocEditScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 81, 37, 114),
        title:
            Text("Edit Info", style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              const Stack(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2F2d%2F00%2F35%2F2d003500486fc421f3497197689a7e06.jpg&f=1&nofb=1&ipt=9fad4b1450c71582ea96205d0b52c75334c0af16c8f6219e2c802ea4bcb57505&ipo=images"),
                  ),
                ),
                Positioned(
                    bottom: 1,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 57, 196, 247),
                      child: Icon(
                        Icons.edit_outlined,
                        size: 20,
                      ),
                    ))
              ]),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField2(
                  hintTextcolor: Colors.white,
                  inputTextcolor: Colors.white,
                  labelColor: Colors.white,
                  labelText: "Name",
                  label: "Name",
                  hintText: "Balam Rawat",
                  controller: nameController),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField2(
                  hintTextcolor: Colors.white,
                  inputTextcolor: Colors.white,
                  labelColor: Colors.white,
                  labelText: "Email",
                  label: "balamrawat123@gmail.com",
                  hintText: "balamrawat123@gmail.com",
                  controller: emailController),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField2(
                  hintTextcolor: Colors.white,
                  inputTextcolor: Colors.white,
                  labelColor: Colors.white,
                  labelText: "Gender",
                  label: "Name",
                  hintText: "Male",
                  controller: genderController),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField2(
                  hintTextcolor: Colors.white,
                  inputTextcolor: Colors.white,
                  labelColor: Colors.white,
                  labelText: "Height",
                  label: "Name",
                  hintText: "5'7\"",
                  controller: heightController),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField2(
                  hintTextcolor: Colors.white,
                  inputTextcolor: Colors.white,
                  labelColor: Colors.white,
                  labelText: "Weight",
                  label: "Name",
                  hintText: "70 kg",
                  controller: weightController),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomButton(
                    isNetwork: false,
                    isRow: false,
                    color: const Color.fromARGB(255, 219, 203, 59),
                    borderclr: const Color.fromARGB(255, 179, 165, 41),
                    fontweight: FontWeight.w700,
                    height: 50,
                    name: "Save",
                    radius: 10,
                    textclr: Colors.black,
                    textsize: 14,
                    onTap: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
