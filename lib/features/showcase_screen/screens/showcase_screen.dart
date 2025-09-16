import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_project/core/shared/extensions/app_localization.dart';
import 'package:flutter_starter_project/features/showcase_screen/screens/components/connection_status_section.dart';
import 'package:flutter_starter_project/features/showcase_screen/screens/components/database_section.dart';
import 'package:flutter_starter_project/features/showcase_screen/screens/components/language_section.dart';
import 'package:flutter_starter_project/features/showcase_screen/screens/components/network_section.dart';
import 'package:flutter_starter_project/features/showcase_screen/screens/components/snackbar_section.dart';
import 'package:flutter_starter_project/features/showcase_screen/screens/components/storage_section.dart';
import 'package:flutter_starter_project/features/showcase_screen/screens/components/theme_section.dart';
import 'package:flutter_starter_project/features/showcase_screen/widgets/section_card.dart';

class ShowcaseScreen extends StatelessWidget {
  const ShowcaseScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.localeKeys.helloWorld)),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: <Widget>[
          SectionCard(
            title: context.localeKeys.connectionStatus,
            child: const ConnectionStatusSection(),
          ),
          SizedBox(height: 16.h),
          SectionCard(
            title: context.localeKeys.theme,
            child: const ThemeSection(),
          ),
          SizedBox(height: 16.h),
          SectionCard(
            title: context.localeKeys.language,
            child: const LanguageSection(),
          ),
          SizedBox(height: 16.h),
          SectionCard(
            title: context.localeKeys.networking,
            child: const NetworkSection(),
          ),
          SizedBox(height: 16.h),
          SectionCard(
            title: context.localeKeys.storage,
            child: const StorageSection(),
          ),
          SizedBox(height: 16.h),
          SectionCard(
            title: context.localeKeys.snackbarUtils,
            child: const SnackbarSection(),
          ),
          SizedBox(height: 16.h),
          const SectionCard(title: 'Drift Database', child: DatabaseSection()),
        ],
      ),
    );
  }
}
