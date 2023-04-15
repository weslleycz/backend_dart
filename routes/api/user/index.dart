import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:firebase_dart/database.dart';
import 'package:uuid/uuid.dart';

import '../../../servers/firebase.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.post:
      return _post(context);
    // case HttpMethod.get:
    //   return _get(context);
    default:
      return Response(body: 'Route not found', statusCode: 400);
  }
}

// Future<Response> _get(RequestContext context) async {
//   var app = await initApp();
//   final firebase =
//       FirebaseDatabase(app: app, databaseURL: Configurations.databaseUrl);
//   final db = firebase.reference();
//   var users = await db.get();
//   return Response(body: json.encode(users));
// }

Future<Response> _post(RequestContext context) async {
  final request = context.request;
  final body = await request.body();
  final payload = json.decode(body);
  var name = payload["name"];
  var password = payload["password"];
  var email = payload["email"];
  var uuid = Uuid();
  var app = await initApp();
  final firebase =
      FirebaseDatabase(app: app, databaseURL: Configurations.databaseUrl);
  var id = uuid.v4();
  final db = firebase.reference().child(id);
  await db.set({'name': name, 'password': password, 'email': email, 'id': id});
  return Response(body: 'Usuário cadastrado');
}
