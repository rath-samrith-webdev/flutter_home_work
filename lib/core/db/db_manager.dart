import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {

  String dbName = "assignment50pt.db";

  static final DBManager instance = DBManager._init();

  DBManager._init();

  Future<Database> get database async {
    // DB Path
    final dbPath = await getDatabasesPath();
    // Path
    final path = join(dbPath , dbName);
    // Open DB
    return openDatabase(path, version: 1, onCreate: _onCreateTable);
  }

  Future<void> _onCreateTable(Database db, int version) async{

    String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    String textType = "TEXT";
    String intType = "INTEGER";
    String doubleType = "REAL";

    String categoryTable = '''
        CREATE TABLE IF NOT EXISTS tbl_category(
          id $idType,
          name $textType
        )
        ''';
    await db.execute(categoryTable);

    String productTable = '''
        CREATE TABLE IF NOT EXISTS tbl_product(
          id $idType,
          name $textType,
          description $textType,
          price $doubleType,
          discount $intType,
          created_date $textType,
          rate $doubleType,
          image $textType
        )
        ''';
    await db.execute(productTable);

    String cartTable = '''
        CREATE TABLE IF NOT EXISTS cart(
          id $idType,
          product_id $textType,
          qty $textType,
          price $doubleType,
          discount $intType,
          total_amount $doubleType
        )
        ''';
    await db.execute(cartTable);

    // Insert dummy data
    await db.rawInsert("INSERT INTO tbl_category (name) VALUES ('All'), ('Men'), ('Women'), ('Kids')");
    
    // Insert new products (created_date desc)
    await db.rawInsert("INSERT INTO tbl_product (name, description, price, discount, created_date, rate, image) VALUES ('Blue Sneakers', 'Lorem ipsum', 17.00, 0, '2023-10-05', 4.5, 'assets/images/cabin.png')");
    await db.rawInsert("INSERT INTO tbl_product (name, description, price, discount, created_date, rate, image) VALUES ('Grey Sneakers', 'Lorem ipsum', 32.00, 0, '2023-10-04', 4.2, 'assets/images/cabin.png')");
    await db.rawInsert("INSERT INTO tbl_product (name, description, price, discount, created_date, rate, image) VALUES ('White Sneakers', 'Lorem ipsum', 21.00, 0, '2023-10-03', 4.8, 'assets/images/cabin.png')");
    
    // Insert top products (rate desc)
    await db.rawInsert("INSERT INTO tbl_product (name, description, price, discount, created_date, rate, image) VALUES ('Red Dress', 'Lorem ipsum', 45.00, 0, '2023-09-01', 5.0, 'assets/images/cabin.png')");
    await db.rawInsert("INSERT INTO tbl_product (name, description, price, discount, created_date, rate, image) VALUES ('Pink Dress', 'Lorem ipsum', 38.00, 0, '2023-09-02', 4.9, 'assets/images/cabin.png')");
    await db.rawInsert("INSERT INTO tbl_product (name, description, price, discount, created_date, rate, image) VALUES ('Yellow Dress', 'Lorem ipsum', 25.00, 0, '2023-09-03', 4.7, 'assets/images/cabin.png')");
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    final db = await instance.database;
    return await db.query('tbl_category');
  }

  Future<List<Map<String, dynamic>>> getNewProducts() async {
    final db = await instance.database;
    return await db.rawQuery('SELECT * FROM tbl_product ORDER BY created_date DESC LIMIT 10');
  }

  Future<List<Map<String, dynamic>>> getTopProducts() async {
    final db = await instance.database;
    return await db.rawQuery('SELECT * FROM tbl_product ORDER BY rate DESC LIMIT 10');
  }
}
