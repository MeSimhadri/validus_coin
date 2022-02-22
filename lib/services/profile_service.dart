import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProfileService {
  Future<Map<dynamic, dynamic>> getProfileData() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'profile.db');
    bool isExisted = await databaseExists(path);
    if (isExisted) {
      Database database = await openDatabase(path, version: 1);
      List<Map> list = await database.rawQuery('SELECT * FROM Profile');
      return list[0];
    } else {
      Database database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Profile (id INTEGER PRIMARY KEY, name TEXT, email TEXT, address TEXT)');
      });
      await database.transaction((txn) async {
        await txn.rawInsert('INSERT INTO Profile(name, email, address) VALUES("", "", "")');
      });
      List<Map> list = await database.rawQuery('SELECT * FROM Profile');
      return list[0];
    }
  }

  Future<Map<dynamic, dynamic>> updateProfile({required String key, required String data}) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'profile.db');
    Database database = await openDatabase(path, version: 1);
    await database.rawUpdate('UPDATE Profile SET $key = ? WHERE id = "1"', [data]);
    List<Map> list = await database.rawQuery('SELECT * FROM Profile');
    return list[0];
  }
}
