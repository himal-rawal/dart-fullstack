import 'package:dart_frog/dart_frog.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart' as shelf;
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

Handler middleware(Handler handler) {
  // optionally override default headers
  final overrideHeaders = {
    ACCESS_CONTROL_ALLOW_ORIGIN: 'http://localhost:60253',
    'Content-Type': 'application/json;charset=utf-8',
  };
  return handler.use(requestLogger()).use(
        fromShelfMiddleware(
          shelf.corsHeaders(
            headers: overrideHeaders,
          ),
        ),
      );
}
