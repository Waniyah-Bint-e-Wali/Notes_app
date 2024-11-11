import 'package:flutter/cupertino.dart';
import'package:path/path.dart';
import'package:sqflite/sqflite.dart';
class DataBaseService{
  final String _dataBaseName="notes_database";
  final int _dataBaseVersion=3;
  final String _tablename ="notes_details";
  final String _notestitle="Title";
  final String _notesdec="Description";
  final String _id="id";
  DataBaseService._constructor();
  static DataBaseService instance=DataBaseService._constructor();
  static Database? _database;
  //Getting database
  Future<Database> get get_dataBase async{
    if (_database!=null){
      return  _database!;
    }
    else{
      _database=await database_initiation();
      return _database!;
    }
  }
  Future<Database> database_initiation() async{
    final directory = await getDatabasesPath();
    final dataBasePath = join(directory, _dataBaseName);
    final dataBase = await openDatabase(dataBasePath, version: _dataBaseVersion, onCreate: (db, version) {
      db.execute('''
      CREATE TABLE $_tablename(
      $_id INTEGER PRIMARY KEY AUTOINCREMENT,
      $_notestitle TEXT NOT NULL,
      $_notesdec TEXT NOT NULL
      )
      ''');
    });
    return dataBase;
  }
  void insertUser(String Title, String Description) async {
    final db = await get_dataBase;
    await db.insert(_tablename, {
      _notestitle:Title,
      _notesdec: Description
    });
    print('----->>>>> inserted');
  }
  Future<List<User>> getUserList() async {
    final db = await get_dataBase;
    final data = await db.query(_tablename);

    List<User> userList = data.map((e) => User(id: e["id"] as int, Title: e["Title"] as String, Description: e["Description"] as String)).toList();

    userList.forEach((e) => {
      print('id: ${e.id}    Title: ${e.Title}    Description: ${e.Description}')
    });

    return userList;
  }
}
class User {
  int id;
  String Title;
  String Description;

  User({required this.id, required this.Title, required this.Description});
}
