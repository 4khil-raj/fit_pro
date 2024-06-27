import 'package:fit_pro/presentation/widgets/form_field/formfield.dart';
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
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 81, 37, 114),
        title: Text("Personal Info",
            style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
