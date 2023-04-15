import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:firebase_dart/implementation/pure_dart.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  FirebaseDart.setup();
  return serve(handler.use(requestLogger()), ip, port);
}
