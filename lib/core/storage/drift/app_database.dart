import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_starter_project/core/storage/drift/daos/example_items_dao.dart';
import 'package:flutter_starter_project/core/storage/drift/tables/example_items.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: <Type>[ExampleItems], daos: <Type>[ExampleItemsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase._internal() : super(_openConnection());

  static Future<AppDatabase> create() async => AppDatabase._internal();

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File(p.join(dir.path, 'app_db.sqlite'));
    return NativeDatabase(file, logStatements: kDebugMode);
  });
}
