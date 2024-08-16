import 'package:fit_pro/application/user_info/user_info_bloc.dart';
import 'package:fit_pro/presentation/screens/user_info/collect_userinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoAppBar extends StatelessWidget {
  const UserInfoAppBar(
      {super.key, required this.progressValue, required this.pageNo});
  final double progressValue;
  final int pageNo;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: pageNo >= 1
          ? IconButton(
              onPressed: () => BlocProvider.of<UserInfoBloc>(context)
                  .add(NavigatorPopEvent(pageNo: pageNo)),
              icon: Icon(Icons.arrow_back))
          : SizedBox(),
      title: LinearProgressIndicator(
        value: progressValue,
        backgroundColor: Colors.grey,
        valueColor: const AlwaysStoppedAnimation<Color>(
            Color.fromARGB(255, 72, 173, 255)),
      ),
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Skip',
            style: TextStyle(
              decorationColor: Color.fromARGB(255, 98, 179, 245),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
