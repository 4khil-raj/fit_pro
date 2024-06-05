import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/presentation/screens/welcomeScreen/welcome.dart';
import 'package:fit_pro/presentation/widgets/alerts/alerts.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TempHome extends StatelessWidget {
  const TempHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () =>
                  alertsWithButtons(context, 'Do you want to Log out..?', () {
                    customNavRemoveuntil(context, const WelcomeScreen());
                    BlocProvider.of<AuthBloc>(context).add(SignoutEvent());
                  }),
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('This Page is underConstruction'),
      ),
    );
  }
}
