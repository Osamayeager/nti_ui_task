import 'package:flutter/material.dart';
import 'package:flutter_application/core/util/app_routes.dart';
import 'package:flutter_application/features/auth/login.dart';
import 'package:flutter_application/features/auth/sign_up.dart';
import 'package:flutter_application/features/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: AppRoutes.loginPage,
      routes: {
        AppRoutes.loginPage: (context) => const Login(),
        AppRoutes.signUpPage: (context) => const SignUp(),
        AppRoutes.homePage: (context) => const Home(initialIndex: 0),
        AppRoutes.analyticsPage: (context) => const Home(initialIndex: 1),
        AppRoutes.schedulePage: (context) => const Home(initialIndex: 2),
        AppRoutes.settingsPage: (context) => const Home(initialIndex: 3),
      },
    );
  }
}
