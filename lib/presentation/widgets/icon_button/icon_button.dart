import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      this.width,
      this.borderclr,
      required this.image,
      this.radius,
      required this.imagepadding});
  final double? width;
  final Color? borderclr;
  final String image;
  final double? radius;
  final double imagepadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      // width: MediaQuery.of(context).size.width / 5,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),
        border: Border.all(color: borderclr ?? Colors.white),
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsets.all(imagepadding),
        // child: Image.asset('assets/icons/google.png'),
        child: Image.asset(image),
      ),
    );
  }
}
