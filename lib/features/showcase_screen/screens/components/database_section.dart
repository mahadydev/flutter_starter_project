import 'dart:math';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_project/app/di/injection.dart';
import 'package:flutter_starter_project/core/storage/drift/app_database.dart';

class DatabaseSection extends StatefulWidget {
  const DatabaseSection({super.key});

  @override
  State<DatabaseSection> createState() => _DatabaseSectionState();
}

class _DatabaseSectionState extends State<DatabaseSection> {
  late Stream<List<ExampleItem>> _dbItemsStream;

  @override
  void initState() {
    super.initState();
    _dbItemsStream = serviceLocator<AppDatabase>().exampleItemsDao
        .watchAllItems();
  }

  Future<void> _addDbItem() async {
    final String name = 'Item ${DateTime.now().millisecondsSinceEpoch}';
    final int value = Random().nextInt(100);
    await serviceLocator<AppDatabase>().exampleItemsDao.insertItem(
      ExampleItemsCompanion(
        name: Value<String>(name),
        value: Value<int>(value),
      ),
    );
  }

  Future<void> _clearDbItems() async {
    await serviceLocator<AppDatabase>().exampleItemsDao.clearAll();
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            ElevatedButton(
              onPressed: _addDbItem,
              child: Text('Add Item', style: TextStyle(fontSize: 14.sp)),
            ),
            SizedBox(width: 12.w),
            ElevatedButton(
              onPressed: _clearDbItems,
              child: Text('Clear All', style: TextStyle(fontSize: 14.sp)),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        StreamBuilder<List<ExampleItem>>(
          stream: _dbItemsStream,
          builder:
              (
                final BuildContext context,
                final AsyncSnapshot<List<ExampleItem>> snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 24.h,
                    width: 24.h,
                    child: const CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.red),
                  );
                }

                final List<ExampleItem> items =
                    snapshot.data ?? <ExampleItem>[];

                if (items.isEmpty) {
                  return Text(
                    'No items in database.',
                    style: TextStyle(fontSize: 14.sp),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items
                      .map(
                        (final ExampleItem item) => Text(
                          'ID: ${item.id}, Name: ${item.name}, '
                          'Value: ${item.value}',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      )
                      .toList(),
                );
              },
        ),
      ],
    );
  }
}
