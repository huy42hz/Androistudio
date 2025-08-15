import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteDemo extends StatefulWidget {
  @override
  _SQLiteDemoState createState() => _SQLiteDemoState();
}

class _SQLiteDemoState extends State<SQLiteDemo> {
  Database? database;

  Future<void> initDB() async {
    String path = join(await getDatabasesPath(), 'demo.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT)",
        );
      },
    );
  }

  Future<void> insertNote(String title) async {
    await database?.insert(
      'notes',
      {'title': title},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getNotes() async {
    return await database?.query('notes') ?? [];
  }

  @override
  void initState() {
    super.initState();
    initDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQLite Demo")),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) async {
              await insertNote(value);
              setState(() {});
            },
            decoration: InputDecoration(labelText: "Nhập ghi chú"),
          ),
          Expanded(
            child: FutureBuilder(
              future: getNotes(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return ListView(
                  children: snapshot.data!
                      .map((note) => ListTile(title: Text(note['title'])))
                      .toList(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
