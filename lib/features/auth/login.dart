import 'package:flutter/material.dart';
import 'package:flutter_application/core/util/app_colors.dart';
import 'package:flutter_application/core/util/app_routes.dart';
import 'package:flutter_application/features/home/home.dart';
import 'package:flutter_application/features/widgets/custom_inupt_field.dart';
import 'package:flutter_application/features/widgets/primary_button.dart';
import 'package:flutter_application/features/widgets/sign_app_bar.dart';
import 'package:flutter_application/core/util/app_typography.dart';
import 'package:flutter_application/features/auth/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _onSignIn() {
    // Navigate directly to Main Navigation Screen without backend auth
    Navigator.pushReplacementNamed(context, AppRoutes.homePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignAppBar(firstText: 'Welocom home',secondText:'Sign in to your home',),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 28),
                  CustomInputField(
                    label: 'Email address',
                    hintText: 'Enter your email',
                  ),
                  SizedBox(height: 15),
                  CustomInputField(
                    label: 'Email address',
                    hintText: 'Enter your email',
                  ),
                  SizedBox(height: 24),

                  // Primary Button
                  PrimaryButton(text: 'Sign In', onPressed: _onSignIn),

                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(child: Divider(color: AppColors.borderGray)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'or continue with',
                          style: AppTypography.badgeCaption,
                        ),
                      ),
                      Expanded(child: Divider(color: AppColors.borderGray)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSocialButton(
                          'Google',
                          Icons.g_mobiledata_rounded,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildSocialButton('Apple', Icons.apple_rounded),
                      ),
                    ],
                  ),

                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: AppTypography.bodyRegular,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.signUpPage);
                        },
                        child: Text(
                          'Sign Up',
                          style: AppTypography.chipLabel.copyWith(
                            color: AppColors.primarySage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



Widget _buildSocialButton(String name, IconData icon) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      color: AppColors.surfaceWhite,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 24, color: AppColors.textDark),
        const SizedBox(width: 8),
        Text(name, style: AppTypography.componentTitle),
      ],
    ),
  );
}
