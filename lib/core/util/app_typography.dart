import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// AppTypography defines all reusable text styles for the Smart Home app,
/// perfectly mapped to the typography extracted from the Figma design.
/// 
/// Primary UI Font: [DM Sans]
/// Display & Numbers Font: [DM Serif Display]
class AppTypography {
  AppTypography._();

  // ==========================================
  // DISPLAY & HERO TITLES (DM Serif Display)
  // ==========================================

  /// Hero numbers / Large stats (40px, Regular)
  /// Used for prominent metrics like "48.2 kWh"
  static TextStyle get heroNumber => GoogleFonts.dmSerifDisplay(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        color: AppColors.textDark,
        height: 1.1,
      );

  /// Main Screen Titles (28px, Regular)
  /// Used for top-level headers like "Energy Usage" or "Analytics"
  static TextStyle get screenTitle => GoogleFonts.dmSerifDisplay(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: AppColors.textDark,
        height: 1.2,
      );

  /// Section Headings Large (26px, Regular)
  static TextStyle get sectionTitleLarge => GoogleFonts.dmSerifDisplay(
        fontSize: 26,
        fontWeight: FontWeight.w400,
        color: AppColors.textDark,
        height: 1.2,
      );

  // ==========================================
  // HEADINGS & SECTION TITLES (DM Sans)
  // ==========================================

  /// Section Headings (18px, SemiBold)
  /// Used for headings like "Daily Breakdown", "Top Consumers"
  static TextStyle get sectionHeading => GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      );

  /// Card Headings & Modal Titles (16px, SemiBold)
  static TextStyle get cardHeading => GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      );

  /// Component Titles / Device Names (15px, SemiBold)
  /// Used inside DeviceCard ("Main Light", "Thermostat") and SettingsTile
  static TextStyle get componentTitle => GoogleFonts.dmSans(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      );

  /// Button Labels (15px, SemiBold)
  static TextStyle get buttonLabel => GoogleFonts.dmSans(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.surfaceWhite,
      );

  // ==========================================
  // BODY & LABELS (DM Sans)
  // ==========================================

  /// Body Medium Bold / Chip Labels (14px, SemiBold)
  /// Used for RoomChip titles ("Living Room", "Bedroom")
  static TextStyle get chipLabel => GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      );

  /// Body Regular (14px, Medium)
  /// Used for general body descriptions and form input text
  static TextStyle get bodyRegular => GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textDark,
      );

  /// Input Field Labels (13px, SemiBold)
  static TextStyle get inputLabel => GoogleFonts.dmSans(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      );

  /// Settings Section Headers (13px, Bold, Accent Color)
  /// Used for grouping headers like "Account", "Preferences", "System"
  static TextStyle get settingsHeader => GoogleFonts.dmSans(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppColors.primarySage,
        letterSpacing: 0.5,
      );

  // ==========================================
  // SUBTITLES & CAPTIONS (DM Sans)
  // ==========================================

  /// Subtitle / Secondary Text (12px, Medium)
  /// Used for device status ("On • 72%", "22°C • Auto")
  static TextStyle get deviceStatusActive => GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.accentGreen,
      );

  static TextStyle get deviceStatusInactive => GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted,
      );

  /// Settings Tile Subtitle (12px, Regular)
  static TextStyle get tileSubtitle => GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
      );

  /// Micro Captions & Badges (10px, Medium)
  static TextStyle get badgeCaption => GoogleFonts.dmSans(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted,
      );

  // ==========================================
  // HELPER EXTENSIONS & METHODS
  // ==========================================

  /// Helper to quickly build a custom DM Sans style with any color or weight
  static TextStyle customSans({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.textDark,
    double? height,
  }) {
    return GoogleFonts.dmSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  /// Helper to quickly build a custom DM Serif Display style
  static TextStyle customSerif({
    double fontSize = 26,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.textDark,
    double? height,
  }) {
    return GoogleFonts.dmSerifDisplay(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }
}
