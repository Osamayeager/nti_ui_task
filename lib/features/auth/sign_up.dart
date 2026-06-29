import 'package:flutter/material.dart';
import 'package:flutter_application/core/util/app_colors.dart';
import 'package:flutter_application/core/util/app_typography.dart';
import 'package:flutter_application/features/widgets/custom_inupt_field.dart';
import 'package:flutter_application/features/widgets/primary_button.dart';
import 'package:flutter_application/features/home/home.dart';
import 'package:flutter_application/features/widgets/sign_app_bar.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreedToTerms = true;

  void _onSignUp() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Home()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textDark),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignAppBar(firstText: 'Get started', secondText: 'Create account',),
              SizedBox(height: 32),

              CustomInputField(
                label: 'Full name',
                hintText: 'Rebecca Barbara',
                controller: _nameController,
                svgPrefix: 'assets/icons/email.svg',
              ),
              CustomInputField(
                label: 'Email address',
                hintText: 'rebecca@home.io',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                svgPrefix: 'assets/icons/email.svg',
              ),
              CustomInputField(
                label: 'Create a password',
                hintText: '••••••••',
                isPassword: true,
                controller: _passwordController,
                svgPrefix: 'assets/icons/password.svg',
              ),

              Row(
                children: [
                  Checkbox(
                    value: _agreedToTerms,
                    onChanged: (val) {
                      setState(() {
                        _agreedToTerms = val ?? false;
                      });
                    },
                    activeColor: AppColors.primarySage,
                  ),
                  Expanded(
                    child: Text(
                      'I agree to the Terms of Service and Privacy Policy',
                      style: AppTypography.tileSubtitle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              PrimaryButton(
                text: 'Create Account',
                onPressed: _onSignUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}