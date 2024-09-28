import 'package:sqflite/sqflite.dart';
import 'plant_model.dart';

class DBHelper {
  Future<Database> database() async {
    return openDatabase(
      'plant_database.db',
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE plants(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, imagePath TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertPlant(Plant plant) async {
    final db = await database();
    await db.insert('plants', plant.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Plant>> getPlants() async {
    final db = await database();
    final List<Map<String, dynamic>> maps = await db.query('plants');
    return List.generate(maps.length, (i) {
      return Plant.fromMap(maps[i]); // Use the factory method to create Plant
    });
  }

  Future<void> updatePlant(Plant plant) async {
    final db = await database();
    await db.update(
      'plants',
      plant.toMap(),
      where: 'id = ?',
      whereArgs: [plant.id],
    );
  }

  Future<void> deletePlant(int id) async {
    final db = await database();
    await db.delete(
      'plants',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
