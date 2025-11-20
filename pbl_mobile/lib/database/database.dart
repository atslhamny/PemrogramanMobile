import 'package:mysql1/mysql1.dart';

class Database {
  static MySqlConnection? _connection;

  static Future<MySqlConnection> getConnection() async {
    if (_connection == null) {
      final settings = ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        db: 'attendance_db',
      );
      _connection = await MySqlConnection.connect(settings);
      print('✅ Database connected successfully!');
    }
    return _connection!;
  }

  static Future<void> closeConnection() async {
    await _connection?.close();
    _connection = null;
  }
}
