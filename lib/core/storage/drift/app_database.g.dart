// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ExampleItemsTable extends ExampleItems
    with TableInfo<$ExampleItemsTable, ExampleItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExampleItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'example_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExampleItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExampleItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExampleItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $ExampleItemsTable createAlias(String alias) {
    return $ExampleItemsTable(attachedDatabase, alias);
  }
}

class ExampleItem extends DataClass implements Insertable<ExampleItem> {
  final int id;
  final String name;
  final int value;
  const ExampleItem({
    required this.id,
    required this.name,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['value'] = Variable<int>(value);
    return map;
  }

  ExampleItemsCompanion toCompanion(bool nullToAbsent) {
    return ExampleItemsCompanion(
      id: Value(id),
      name: Value(name),
      value: Value(value),
    );
  }

  factory ExampleItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExampleItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<int>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<int>(value),
    };
  }

  ExampleItem copyWith({int? id, String? name, int? value}) => ExampleItem(
    id: id ?? this.id,
    name: name ?? this.name,
    value: value ?? this.value,
  );
  ExampleItem copyWithCompanion(ExampleItemsCompanion data) {
    return ExampleItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExampleItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.value == this.value);
}

class ExampleItemsCompanion extends UpdateCompanion<ExampleItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> value;
  const ExampleItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.value = const Value.absent(),
  });
  ExampleItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int value,
  }) : name = Value(name),
       value = Value(value);
  static Insertable<ExampleItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    });
  }

  ExampleItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? value,
  }) {
    return ExampleItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExampleItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExampleItemsTable exampleItems = $ExampleItemsTable(this);
  late final ExampleItemsDao exampleItemsDao = ExampleItemsDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [exampleItems];
}

typedef $$ExampleItemsTableCreateCompanionBuilder =
    ExampleItemsCompanion Function({
      Value<int> id,
      required String name,
      required int value,
    });
typedef $$ExampleItemsTableUpdateCompanionBuilder =
    ExampleItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> value,
    });

class $$ExampleItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ExampleItemsTable> {
  $$ExampleItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExampleItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExampleItemsTable> {
  $$ExampleItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExampleItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExampleItemsTable> {
  $$ExampleItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$ExampleItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExampleItemsTable,
          ExampleItem,
          $$ExampleItemsTableFilterComposer,
          $$ExampleItemsTableOrderingComposer,
          $$ExampleItemsTableAnnotationComposer,
          $$ExampleItemsTableCreateCompanionBuilder,
          $$ExampleItemsTableUpdateCompanionBuilder,
          (
            ExampleItem,
            BaseReferences<_$AppDatabase, $ExampleItemsTable, ExampleItem>,
          ),
          ExampleItem,
          PrefetchHooks Function()
        > {
  $$ExampleItemsTableTableManager(_$AppDatabase db, $ExampleItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExampleItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExampleItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExampleItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> value = const Value.absent(),
              }) => ExampleItemsCompanion(id: id, name: name, value: value),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int value,
              }) => ExampleItemsCompanion.insert(
                id: id,
                name: name,
                value: value,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExampleItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExampleItemsTable,
      ExampleItem,
      $$ExampleItemsTableFilterComposer,
      $$ExampleItemsTableOrderingComposer,
      $$ExampleItemsTableAnnotationComposer,
      $$ExampleItemsTableCreateCompanionBuilder,
      $$ExampleItemsTableUpdateCompanionBuilder,
      (
        ExampleItem,
        BaseReferences<_$AppDatabase, $ExampleItemsTable, ExampleItem>,
      ),
      ExampleItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExampleItemsTableTableManager get exampleItems =>
      $$ExampleItemsTableTableManager(_db, _db.exampleItems);
}
