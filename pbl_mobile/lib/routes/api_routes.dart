import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../controllers/clocks_controller.dart';

Router createRouter() {
  final router = Router();

  // Health check
  router.get('/api/health', (Request request) {
    return Response.ok('{"status": "API is running"}');
  });

  // Clocks endpoints
  router.get('/api/clocks', ClocksController.getAllClocks);
  router.get('/api/clocks/user/<userId>', ClocksController.getClocksByUserId);
  router.post('/api/clocks', ClocksController.createClock);
  router.delete('/api/clocks/<id>', ClocksController.deleteClock);

  return router;
}
