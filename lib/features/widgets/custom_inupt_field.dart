import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/util/app_colors.dart';
import '../../core/util/app_typography.dart';


class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? svgPrefix;
  final Widget? suffixIcon;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.svgPrefix,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
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
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboardType,
            style: AppTypography.bodyRegular.copyWith(color: const Color(0xFF1A1A1A), fontSize: 14),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTypography.tileSubtitle.copyWith(color: const Color(0xFF8A8A80), fontSize: 14),
              filled: true,
              fillColor: AppColors.surfaceWhite,
              prefixIcon: svgPrefix != null
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(
                        svgAsset(svgPrefix!),
                        width: 16,
                        height: 16,
                        colorFilter: const ColorFilter.mode(Color(0xFF8A8A80), BlendMode.srcIn),
                      ),
                    )
                  : null,
              suffixIcon: suffixIcon,
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
        const SizedBox(height: 16),
      ],
    );
  }

  String svgAsset(String name) {
    if (name.startsWith('assets/')) return name;
    return 'assets/icons/$name';
  }
}
