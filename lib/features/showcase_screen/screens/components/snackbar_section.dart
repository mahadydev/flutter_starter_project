import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_project/core/shared/extensions/app_localization.dart';
import 'package:flutter_starter_project/core/utils/snackbar_util.dart';

class SnackbarSection extends StatelessWidget {
  const SnackbarSection({super.key});

  @override
  Widget build(final BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.message, size: 20.sp),
      label: Text(
        context.localeKeys.showSnackbar,
        style: TextStyle(fontSize: 14.sp),
      ),
      onPressed: () {
        SnackbarUtil.showSnackbar(
          context: context,
          message: context.localeKeys.snackbarMessage,
        );
      },
    );
  }
}
