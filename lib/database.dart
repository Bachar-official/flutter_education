import 'package:flutter/material.dart';
import 'package:flutter_education/entity/cat.dart';
import 'package:flutter_education/entity/cat_card.dart';
import 'package:flutter_education/entity/cat_dialog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseExample extends StatefulWidget {
  const DatabaseExample({Key? key}) : super(key: key);

  @override
  State<DatabaseExample> createState() => _DatabaseExampleState();
}

class _DatabaseExampleState extends State<DatabaseExample> {
  late final Database database;
  late String databasePath = '';
  List<Cat> cats = [];

  @override
  void initState() {
    super.initState();
    getDatabasesPath().then((result) => databasePath = result);
    setState(() {});

    openDatabase(
      join(databasePath, 'cats_database.db'),
      // Если БД запускается впервые, создать таблицу
      onCreate: (db, version) {
        // Запустить CREATE TABLE в БД.
        return db.execute(
          'CREATE TABLE cats(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    ).then((result) => database = result);
  }

  Future<void> insertCat(Cat cat) async {
    await database.insert('cats', cat.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    await getCats();
    setState(() {});
  }

  Future<void> getCats() async {
    final List<Map<String, dynamic>> maps = await database.query('cats');
    cats = maps.map((map) => Cat.fromMap(map)).toList();
    setState(() {});
  }

  Future<void> updateDog(Cat cat) async {
    await database.update(
      'cats',
      cat.toMap(),
      // Удостовериться, что собака существует
      where: 'id = ?',
      // Прокинуть id кота как whereArg чтобы предотвратить SQL инъекции
      whereArgs: [cat.id],
    );
  }

  Future<void> deleteCat(int id) async {
    await database.delete(
      'cats',
      // Использовать `where` чтобы удалить определенного кота.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    await getCats();
  }

  void _showCatDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CatDialog(insertCat: insertCat),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database'),
        actions: [
          IconButton(
            onPressed: () => _showCatDialog(context),
            icon: const Icon(Icons.add),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async => await getCats(),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cats.length,
        itemBuilder: (context, index) => CatCard(
          cat: cats[index],
          deleteCat: deleteCat,
        ),
      ),
    );
  }
}
