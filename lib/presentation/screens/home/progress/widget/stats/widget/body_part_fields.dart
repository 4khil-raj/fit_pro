import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/add_body_part.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/form_field/formfield2.dart';
import 'package:flutter/material.dart';

class BodyPartsTextFields extends StatefulWidget {
  const BodyPartsTextFields({super.key});

  @override
  State<BodyPartsTextFields> createState() => _BodyPartsTextFieldsState();
}

class _BodyPartsTextFieldsState extends State<BodyPartsTextFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextFormField2(
              labelColor: Colors.white,
              labelText: "Body Part Name",
              hintText: "Chest",
              hintTextcolor: Colors.white,
              inputTextcolor: Colors.white,
              controller: bodyPartNameController,
              label: "label"),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField2(
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.white,
              ),
              labelColor: Colors.white,
              labelText: "Scale",
              hintText: "Inces/cm/Kg/Lb",
              hintTextcolor: Colors.white,
              inputTextcolor: Colors.white,
              controller: scaleController,
              label: "label"),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField2(
              labelColor: Colors.white,
              labelText: "Measurement",
              hintText: "75",
              hintTextcolor: Colors.white,
              inputTextcolor: Colors.white,
              controller: measurementController,
              label: "label"),
          const SizedBox(
            height: 30,
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
                  name: "Cancel",
                  radius: 10,
                  onTap: () {},
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
                  name: "Add",
                  radius: 10,
                  onTap: () {},
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
    );
  }
}
