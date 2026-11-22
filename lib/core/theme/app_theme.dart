import 'package:flutter/material.dart';

abstract class AppColors {
  static const actionPrimary = Color(0xFFC7EB80); // CTA, chip, pilihan aktif
  static const textPrimary = Color(0xFF24364A); // teks utama, ikon, aksi inverse
  static const textSecondary = Color(0xFF687883); // deskripsi, metadata
  static const surfaceDefault = Color(0xFFFFFFFF); // kartu netral
  static const backgroundDefault = Color(0xFFFAF9F2); // latar mockup

  static const surfaceTonal = Color(0xFFEAF3F4); // banner, tombol tonal
  static const surfaceStatus = Color(0xFFEEF2E3); // badge, statistik
  static const progressTrack = Color(0xFFEEF2E9); // jalur progress

  static const borderDefault = Color(0xFFDCE4D3); // outline, divider
  static const borderSubtle = Color(0xFFEDF0E9); // pemisah ringan

  static const actionDisabled = Color(0xFFE6EDDA); // container nonaktif
  static const textDisabled = Color(0xFF7C8975); // label nonaktif

  static const chartInactive = Color(0xFFC8DEE3); // batang grafik historis
  static const stepInactive = Color(0xFFDBE0D4); // titik onboarding
}

abstract class AppRadius {
  static const card = 20.0; // radius/card
  static const banner = 24.0; // radius/banner
  static const dialog = 28.0; // radius/dialog
  static const pill = 100.0; // radius/full
}

abstract class AppSpacing {
  static const s4 = 4.0;
  static const s8 = 8.0;
  static const s12 = 12.0;
  static const s16 = 16.0;
  static const s24 = 24.0;
  static const s32 = 32.0;

  static const gutter = 24.0;
  static const paddingCard = 16.0;
  static const gapSectionMin = 16.0;
  static const gapSectionMax = 24.0;
  static const ctaHeight = 56.0;
  static const touchTarget = 48.0;
  static const navBarHeight = 72.0;
}

abstract class AppShadows {
  static const flat = <BoxShadow>[];
  static const cardSubtle = <BoxShadow>[
    BoxShadow(offset: Offset(0, 3), blurRadius: 8, color: Color(0x08000000)),
  ];
  static const dialog = <BoxShadow>[
    BoxShadow(offset: Offset(0, 12), blurRadius: 40, color: Color(0x4024364A)),
  ];
  static const speech = <BoxShadow>[
    BoxShadow(offset: Offset(0, 4), blurRadius: 16, color: Color(0x20142638)),
  ];
}

abstract class AppTextStyles {
  static const font = 'Nunito';

  static const display = TextStyle(fontFamily: font, fontSize: 44, height: 56 / 44, fontWeight: FontWeight.w900, color: AppColors.textPrimary);
  static const headlineLarge = TextStyle(fontFamily: font, fontSize: 34, height: 40 / 34, fontWeight: FontWeight.w900, color: AppColors.textPrimary);
  static const headlineMedium = TextStyle(fontFamily: font, fontSize: 32, height: 40 / 32, fontWeight: FontWeight.w900, color: AppColors.textPrimary);
  static const headlineSmall = TextStyle(fontFamily: font, fontSize: 28, height: 36 / 28, fontWeight: FontWeight.w900, color: AppColors.textPrimary);

  static const titleLarge = TextStyle(fontFamily: font, fontSize: 20, height: 28 / 20, fontWeight: FontWeight.w900, color: AppColors.textPrimary);
  static const titleSection = TextStyle(fontFamily: font, fontSize: 18, height: 24 / 18, fontWeight: FontWeight.w900, color: AppColors.textPrimary);
  static const titleMedium = TextStyle(fontFamily: font, fontSize: 16, height: 24 / 16, fontWeight: FontWeight.w800, color: AppColors.textPrimary);

  static const bodyLarge = TextStyle(fontFamily: font, fontSize: 16, height: 24 / 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary);
  static const bodyMedium = TextStyle(fontFamily: font, fontSize: 14, height: 20 / 14, fontWeight: FontWeight.w600, color: AppColors.textSecondary);
  static const bodySmall = TextStyle(fontFamily: font, fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary);

  static const labelLarge = TextStyle(fontFamily: font, fontSize: 14, height: 20 / 14, fontWeight: FontWeight.w800, color: AppColors.textPrimary);
  static const labelMedium = TextStyle(fontFamily: font, fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w800, color: AppColors.textPrimary);
  static const labelSmall = TextStyle(fontFamily: font, fontSize: 11, height: 16 / 11, fontWeight: FontWeight.w700, color: AppColors.textSecondary);
}

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    const scheme = ColorScheme.light(
      primary: AppColors.actionPrimary,
      onPrimary: AppColors.textPrimary,
      secondary: AppColors.textPrimary,
      onSecondary: Colors.white,
      surface: AppColors.surfaceDefault,
      onSurface: AppColors.textPrimary,
      surfaceContainerLowest: AppColors.backgroundDefault,
      surfaceContainer: AppColors.surfaceTonal,
      outline: AppColors.borderDefault,
      outlineVariant: AppColors.borderSubtle,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.backgroundDefault,
      fontFamily: AppTextStyles.font,
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.display,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: AppTextStyles.headlineSmall,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceDefault,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surfaceDefault,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.dialog),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.borderSubtle,
        thickness: 1,
        space: 1,
      ),
      // Banner tonal, app bar, chip, switch, navigasi: flat
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDefault,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
      chipTheme: ChipThemeData(
        color: const WidgetStatePropertyAll(AppColors.surfaceStatus),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
        side: BorderSide.none,
        labelStyle: AppTextStyles.labelMedium,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: const WidgetStatePropertyAll(AppColors.textPrimary),
        trackColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? AppColors.actionPrimary : AppColors.stepInactive),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: AppSpacing.navBarHeight,
        backgroundColor: AppColors.backgroundDefault,
        elevation: 0,
        indicatorColor: AppColors.actionPrimary,
        labelTextStyle: const WidgetStatePropertyAll(AppTextStyles.labelSmall),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, AppSpacing.ctaHeight),
          backgroundColor: AppColors.actionPrimary,
          foregroundColor: AppColors.textPrimary,
          textStyle: AppTextStyles.labelLarge,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
        ),
      ),
    );
  }
}
