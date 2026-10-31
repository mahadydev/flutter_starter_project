// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_items_dao.dart';

// ignore_for_file: type=lint
mixin _$ExampleItemsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ExampleItemsTable get exampleItems => attachedDatabase.exampleItems;
  ExampleItemsDaoManager get managers => ExampleItemsDaoManager(this);
}

class ExampleItemsDaoManager {
  final _$ExampleItemsDaoMixin _db;
  ExampleItemsDaoManager(this._db);
  $$ExampleItemsTableTableManager get exampleItems =>
      $$ExampleItemsTableTableManager(_db.attachedDatabase, _db.exampleItems);
}
