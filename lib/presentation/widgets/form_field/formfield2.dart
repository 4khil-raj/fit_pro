import 'package:flutter/material.dart';

class CustomTextFormField2 extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxlength;
  final Color? inputTextcolor;
  final Color? hintTextcolor;
  final String? labelText;
  final Icon? suffixIcon;
  final Color? labelColor;
  final String label;
  final Function()? onTap;

  const CustomTextFormField2({
    super.key,
    this.maxlength,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.inputTextcolor,
    this.hintTextcolor,
    this.labelText,
    this.suffixIcon,
    this.labelColor,
    this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: inputTextcolor),
      maxLength: maxlength,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: obscureText
            ? IconButton(
                onPressed: onTap,
                icon: const Icon(
                  Icons.visibility_off,
                  color: Colors.white,
                ))
            : IconButton(
                onPressed: onTap, icon: suffixIcon ?? const SizedBox()),
        label: Text(
          '$labelText',
          style: TextStyle(color: labelColor),
        ),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Color.fromARGB(255, 189, 179, 179),
              width: 2.0), // Material design color
        ),
        // labelText: label,
        hintStyle: TextStyle(color: hintTextcolor),
        fillColor: Colors.transparent,
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
