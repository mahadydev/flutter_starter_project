import 'package:drift/drift.dart';
import 'package:flutter_starter_project/core/storage/drift/app_database.dart';
import 'package:flutter_starter_project/core/storage/drift/tables/example_items.dart';

part 'example_items_dao.g.dart';

@DriftAccessor(tables: [ExampleItems])
class ExampleItemsDao extends DatabaseAccessor<AppDatabase>
    with _$ExampleItemsDaoMixin {
  ExampleItemsDao(super.db);

  Future<int> insertItem(ExampleItemsCompanion item) =>
      into(exampleItems).insert(item);

  Future<List<ExampleItem>> getAllItems() => select(exampleItems).get();

  Stream<List<ExampleItem>> watchAllItems() => select(exampleItems).watch();

  Future<void> clearAll() => delete(exampleItems).go();
}
