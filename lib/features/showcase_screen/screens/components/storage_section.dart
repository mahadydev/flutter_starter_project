import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_project/app/di/injection.dart';
import 'package:flutter_starter_project/core/shared/extensions/app_localization.dart';
import 'package:flutter_starter_project/core/storage/simple_storage.dart';

class StorageSection extends StatefulWidget {
  const StorageSection({super.key});

  @override
  State<StorageSection> createState() => _StorageSectionState();
}

class _StorageSectionState extends State<StorageSection> {
  String? _storageValue;

  Future<void> _saveToStorage() async {
    final SimpleStorageService storage = serviceLocator<SimpleStorageService>();
    await storage.setString(
      'showcase_key',
      'Hello from Showcase! ${DateTime.now()}',
    );
  }

  Future<void> _readFromStorage() async {
    final SimpleStorageService storage = serviceLocator<SimpleStorageService>();
    final String? value = await storage.getString('showcase_key');
    setState(() {
      _storageValue = value ?? context.localeKeys.noValueFound;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            ElevatedButton(
              onPressed: _saveToStorage,
              child: Text(
                context.localeKeys.saveValue,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            SizedBox(width: 12.w),
            ElevatedButton(
              onPressed: _readFromStorage,
              child: Text(
                context.localeKeys.readValue,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ],
        ),
        if (_storageValue != null) ...<Widget>[
          SizedBox(height: 8.h),
          Text(
            context.localeKeys.stored(_storageValue!),
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ],
    );
  }
}
