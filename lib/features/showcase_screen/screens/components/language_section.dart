import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_project/app/generated/app_localizations.dart';
import 'package:flutter_starter_project/app/language/language_cubit.dart';
import 'package:flutter_starter_project/app/language/language_state.dart';
import 'package:flutter_starter_project/core/shared/extensions/app_localization.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key});

  @override
  Widget build(final BuildContext context) {
    final LanguageCubit languageCubit = context.read<LanguageCubit>();

    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (final BuildContext context, final LanguageState langState) {
        return Row(
          children: <Widget>[
            Text(
              context.localeKeys.current(
                langState.locale?.languageCode.toUpperCase() ?? '',
              ),
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              //add outlined border to the dropdown
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButton<Locale>(
                  elevation: 0,
                  underline: const SizedBox.shrink(),
                  isExpanded: true,
                  value: langState.locale,
                  onChanged: (final Locale? newLocale) async {
                    if (newLocale != null) {
                      await languageCubit.switchLanguage(newLocale);
                    }
                  },
                  items: AppLocalizations.supportedLocales.map((
                    final Locale locale,
                  ) {
                    return DropdownMenuItem<Locale>(
                      value: locale,
                      child: Padding(
                        // if rtl add padding to the left
                        padding: EdgeInsets.only(
                          right: langState.locale!.languageCode == 'ar'
                              ? 16.w
                              : 0,
                          left: langState.locale!.languageCode == 'ar'
                              ? 0
                              : 16.w,
                        ),
                        child: Text(
                          locale.toLanguageTag().toUpperCase(),
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
