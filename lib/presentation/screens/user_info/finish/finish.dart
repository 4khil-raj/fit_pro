import 'package:fit_pro/presentation/screens/user_info/finish/widget/background.dart';
import 'package:fit_pro/presentation/screens/user_info/finish/widget/positioned.dart';
import 'package:flutter/material.dart';

class UserInfoFinishPage extends StatelessWidget {
  const UserInfoFinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      //addcoloum on positioned
      body: Stack(children: [FinishBackground(), CustomFinishPositioned()]),
    ));
  }
}
