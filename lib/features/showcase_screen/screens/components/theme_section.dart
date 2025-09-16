import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_project/app/theme/cubit/theme_cubit.dart';
import 'package:flutter_starter_project/app/theme/cubit/theme_state.dart';
import 'package:flutter_starter_project/core/shared/extensions/app_localization.dart';

class ThemeSection extends StatelessWidget {
  const ThemeSection({super.key});

  @override
  Widget build(final BuildContext context) {
    final ThemeCubit themeCubit = context.read<ThemeCubit>();

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (final BuildContext context, final ThemeState state) {
        return Row(
          children: <Widget>[
            Text(
              context.localeKeys.current(state.themeMode.name),
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(width: 16.w),
            ElevatedButton.icon(
              icon: Icon(Icons.brightness_6, size: 20.sp),
              label: Text(
                context.localeKeys.toggleTheme,
                style: TextStyle(fontSize: 14.sp),
              ),
              onPressed: () async {
                final bool isDark = state.themeMode == ThemeMode.dark;
                await themeCubit.switchTheme(
                  isDark ? ThemeMode.light : ThemeMode.dark,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
