import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/util/app_colors.dart';
import '../../core/util/app_typography.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({super.key, required this.lable});
  final String lable;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lable,
          style: AppTypography.inputLabel.copyWith(
            color: const Color(0xFF1A1A1A),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 52,
          child: TextFormField(
            obscureText: _obscureText,
            style: AppTypography.bodyRegular.copyWith(color: const Color(0xFF1A1A1A), fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: AppTypography.tileSubtitle.copyWith(color: const Color(0xFF8A8A80), fontSize: 14),
              filled: true,
              fillColor: AppColors.surfaceWhite,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  'assets/icons/password.svg',
                  width: 16,
                  height: 16,
                  colorFilter: const ColorFilter.mode(Color(0xFF8A8A80), BlendMode.srcIn),
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: const Color(0xFF8A8A80),
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFDDDDDD), width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFDDDDDD), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primarySage, width: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
