import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/application/user_info/user_info_bloc.dart';
import 'package:fit_pro/presentation/screens/auth/signin/widgets/buttons.dart';
import 'package:fit_pro/presentation/screens/auth/signin/widgets/remember_me.dart';
import 'package:fit_pro/presentation/screens/auth/signin/widgets/text_fields.dart';
import 'package:fit_pro/presentation/screens/auth/signup/widgets/policy.dart';
import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/user_info/collect_userinfo.dart';
import 'package:fit_pro/presentation/widgets/alerts/alerts.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

const loginTockenkey = '';
const accessTockenkey = '';

// ignore: must_be_immutable
class SignupOrSignin extends StatelessWidget {
  SignupOrSignin({super.key, required this.signup});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberme = false;
  bool obsecure = true;
  bool social = false;
  bool other = false;
  bool signup;
  @override
  Widget build(BuildContext context) {
    obsecure = true;
    BlocProvider.of<UserInfoBloc>(context).add(UserInfoEvent());
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 6, 2, 19),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: SingleChildScrollView(child:
                BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              if (state is RemembermeState) {
                rememberme = state.rememberme;
              } else if (state is ObsecureTextState) {
                obsecure = state.obsecureText;
              } else if (state is SignUpAuthSuccessState) {
                social = state.google;
                other = state.other;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  // saveinfo('user');
                  customNavRemoveuntil(
                      context, const UserInfoCollectingScreen());
                  BlocProvider.of<AuthBloc>(context).add(AuthEvent());
                });
              } else if (state is Authenticated) {
                social = false;
                other = false;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  // saveinfo('user');
                  customNavRemoveuntil(context, const BottomNavBar());
                  BlocProvider.of<AuthBloc>(context).add(AuthEvent());
                });
              } else if (state is AuthError) {
                social = false;
                other = false;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  alerts(context, state.message.toString());
                });
                BlocProvider.of<AuthBloc>(context).add(AuthEvent());
              } else if (state is AuthLoading) {
                social = state.google;
                other = state.other;
              }
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        const SizedBox(
                          height: 11,
                        ),
                        LoginFields(
                          obsecure: obsecure,
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                        RememberMeLogIn(
                          remember: rememberme,
                        ),
                        LogInButtons(
                          other: other,
                          social: social,
                          emailController: emailController,
                          passwordController: passwordController,
                          signup: signup,
                        ),
                        const AuthPrivacyPolicy()
                      ])));
            }))));
  }
}

void saveinfo(String value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString(loginTockenkey, value);
}

Future<void> clearLoginInfo() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

void saveJWStocken(String value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString(accessTockenkey, value);
  await getAccessTocken();
}

dynamic accesstocken;
Future<void> getAccessTocken() async {
  final sharedpreference = await SharedPreferences.getInstance();
  accesstocken = sharedpreference.getString(accessTockenkey);
}
