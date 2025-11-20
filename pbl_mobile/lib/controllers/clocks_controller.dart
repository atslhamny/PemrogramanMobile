import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:uuid/uuid.dart';
import '../database/database.dart';
import '../models/clock_model.dart';

class ClocksController {
  // GET ALL Clocks
  static Future<Response> getAllClocks(Request request) async {
    try {
      final conn = await Database.getConnection();
      var results = await conn.query(
        'SELECT * FROM check_clocks WHERE deleted_at IS NULL ORDER BY created_at DESC',
      );

      List<Clock> clocks = results.map((row) => Clock.fromRow(row)).toList();

      return Response.ok(
        jsonEncode({
          'success': true,
          'message': 'Data retrieved successfully',
          'data': clocks.map((c) => c.toJson()).toList(),
        }),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'success': false, 'message': 'Error: $e'}),
      );
    }
  }

  // GET Clock by User ID
  static Future<Response> getClocksByUserId(
    Request request,
    String userId,
  ) async {
    try {
      final conn = await Database.getConnection();
      var results = await conn.query(
        'SELECT * FROM check_clocks WHERE user_id = ? AND deleted_at IS NULL ORDER BY created_at DESC',
        [userId],
      );

      List<Clock> clocks = results.map((row) => Clock.fromRow(row)).toList();

      return Response.ok(
        jsonEncode({
          'success': true,
          'message': 'Data retrieved successfully',
          'data': clocks.map((c) => c.toJson()).toList(),
        }),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'success': false, 'message': 'Error: $e'}),
      );
    }
  }

  // CREATE Clock (Clock In/Out)
  static Future<Response> createClock(Request request) async {
    try {
      final payload = jsonDecode(await request.readAsString());

      if (payload['user_id'] == null || payload['check_clock_type'] == null) {
        return Response.badRequest(
          body: jsonEncode({
            'success': false,
            'message': 'user_id and check_clock_type are required',
          }),
        );
      }

      final conn = await Database.getConnection();
      final id = Uuid().v4();

      await conn.query(
        '''INSERT INTO check_clocks 
           (id, user_id, check_clock_type, check_clock_time, created_at, updated_at) 
           VALUES (?, ?, ?, CURTIME(), NOW(), NOW())''',
        [id, payload['user_id'], payload['check_clock_type']],
      );

      return Response.ok(
        jsonEncode({
          'success': true,
          'message': 'Clock recorded successfully',
          'data': {'id': id},
        }),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'success': false, 'message': 'Error: $e'}),
      );
    }
  }

  // DELETE Clock
  static Future<Response> deleteClock(Request request, String id) async {
    try {
      final conn = await Database.getConnection();

      await conn.query(
        'UPDATE check_clocks SET deleted_at = NOW() WHERE id = ?',
        [id],
      );

      return Response.ok(
        jsonEncode({'success': true, 'message': 'Clock deleted successfully'}),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'success': false, 'message': 'Error: $e'}),
      );
    }
  }
}
