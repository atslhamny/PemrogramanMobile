import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import '../lib/routes/api_routes.dart';
import '../lib/database/database.dart'; // ✅ Tambahan: Import database

// Middleware CORS
Middleware corsHeaders() {
  return (Handler handler) {
    return (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response.ok(
          '',
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
            'Access-Control-Allow-Headers': 'Content-Type, Authorization',
          },
        );
      }

      final response = await handler(request);
      return response.change(
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type, Authorization',
        },
      );
    };
  };
}

void main() async {
  print('🔄 Starting server...');

  // ✅ Tambahan: Test koneksi database
  try {
    await Database.getConnection();
  } catch (e) {
    print('❌ Database connection failed: $e');
    print('⚠️  Make sure MySQL is running and check your credentials');
    exit(1); // Stop server jika database gagal
  }

  final router = createRouter();

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(router);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await shelf_io.serve(handler, 'localhost', port);

  print('🚀 Server running on http://${server.address.host}:${server.port}');
  print('📡 Try: http://localhost:$port/api/health');
}
