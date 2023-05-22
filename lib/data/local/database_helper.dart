import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:potje_test_assignment/model/git_repos_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'repos.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorite_repos(
          id INTEGER,
          full_name TEXT,
          html_url TEXT
      )
      ''');
    await db.execute('''
      CREATE TABLE search_history(
        id INTEGER PRIMARY KEY,
        full_name TEXT,
        html_url TEXT
      )
      ''');
  }

  Future<List<GitRepo>> getFavorites() async {
    Database db = await instance.database;
    var favoriteRepos = await db.query('favorite_repos');
    final favoriteReposList =
        favoriteRepos.map((e) => GitRepo.fromJson(e)).toList();
    return favoriteReposList;
  }

  Future<List<GitRepo>> getHistory() async {
    Database db = await instance.database;
    var searchHistoryRepos = await db.query('search_history');
    final searchHistoryList =
        searchHistoryRepos.map((e) => GitRepo.fromJson(e)).toList();
    log(searchHistoryList.toString());
    return searchHistoryList;
  }

  Future<int> addFavorite(GitRepo gitRepo) async {
    Database db = await instance.database;
    return await db.insert('favorite_repos', gitRepo.toMap());
  }

  Future<int> addToHistory(String fullName) async {
    Database db = await instance.database;
    return await db
        .insert('search_history', {'full_name': fullName, 'html_url': ''});
  }

  Future<int> deleteFavorite(GitRepo gitRepo) async {
    Database db = await instance.database;
    return await db.delete('favorite_repos',
        where: "id = ?", whereArgs: [gitRepo.id.toString()]);
  }
}
