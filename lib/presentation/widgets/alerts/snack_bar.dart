import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:google_fonts/google_fonts.dart';

homeSnackbar(context, String msg, Color clr) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.transparent,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.info,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            msg,
            style: GoogleFonts.rubik(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w800),
          )
        ],
      )));
}
