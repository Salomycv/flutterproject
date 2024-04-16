import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './student.dart';

class DatabaseHelper{
static final DatabaseHelper instance= DatabaseHelper._privateConstructor();
static Database? _database;
DatabaseHelper._privateConstructor();

Future<Database> get database async{
  if(_database !=null) return _database!;
_database=await _initDatabase();
return _database!;
}

Future<Database> _initDatabase() async{
  String path=join (await getDatabasesPath(), 'MyDatabase.db');
  return await openDatabase(path,
  version: 1,
  onCreate: _createDatabase,);
}

void _createDatabase(Database db, int version) async{
await db.execute(
  '''
CREATE TABLE student(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT, age INTEGER, address TEXT, contactno INTEGER
)
''',
);
}

Future<int> insertStudent(Student student)async{
  Database db=await instance.database;
  return await db.insert('student', student.toMap());
}



// Future<void> updateStudent(Student student) async {
//   final db = await instance.database;
//   await db.update(
//     'student',
//     student.toMap(),
//     where: 'id = ?',
//     whereArgs: [student.id],
//   );
// }


Future<int> updateStudent(Student student) async {
  final db = await database;

  return await db.update(
    'students', 
    student.toMap(),
    where: 'id = ?',
    whereArgs: [student.id],
  );
}
Future<void> deleteStudent(int id) async {
  final db = await instance.database;
  await db.delete(
    'student',
    where: 'id = ?',
    whereArgs: [id],
  );
  print('Student with id $id deleted successfully');
}


}
