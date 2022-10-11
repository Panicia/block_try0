import 'package:block_try0/Counter/Data/Models/counter_dto.dart';
import '../counter_storage_interface.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class CounterSqlStorage implements ICounterStorage {
  CounterSqlStorage._privateConstructor();
  static final CounterSqlStorage instance = CounterSqlStorage._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'counter.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE counter_table(
        id INTEGER PRIMARY KEY,
        counter INTEGER
      )
    ''');
  }

  @override
  Future<List<CounterDto>> getDtoList() async {
    return getCounterList();
  }

  @override
  Future<void> addDto(CounterDto counterDto) async {
    add(counterDto);
  }

  @override
  Future<void> updateDto(CounterDto counterDto) async {
    await remove(counterDto.id!);
    await add(counterDto);
  }

  Future<List<CounterDto>> getCounterList() async {
    Database db = await instance.database;
    var counter = await db.query('counter_table', orderBy: 'counter');
    List<CounterDto> counterList = counter.isNotEmpty
        ? counter.map((c) => CounterDto.fromMap(c)).toList()
        : [];
    return counterList;
  }

  Future<int> add(CounterDto counterDto) async {
    Database db = await instance.database;
    return await db.insert('counter_table', counterDto.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('counter_table', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(CounterDto counterDto) async {
    Database db = await instance.database;
    return await db.update('counter_table', counterDto.toMap(), where: 'id = ?', whereArgs: [counterDto.id]);
  }

}