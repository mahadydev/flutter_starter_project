import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_project/app/app.dart';
import 'package:flutter_starter_project/app/di/injection.dart';
import 'package:flutter_starter_project/core/constants/app_constants.dart';
import 'package:flutter_starter_project/core/services/platform/platform_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: AppConstants.envFilePath);
  await platformSetup();
  await configureDependencies();

  runApp(
    ScreenUtilInit(
      designSize: const Size(440, 956), // iPhone 16 Pro Max
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MyApp();
      },
    ),
  );
}
