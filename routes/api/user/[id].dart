import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:firebase_dart/database.dart';

import '../../../servers/firebase.dart';

Object onRequest(RequestContext context, String id) {
  switch (context.request.method) {
    case HttpMethod.delete:
      return _delete(context, id);
    case HttpMethod.get:
      return _get(context, id);
    case HttpMethod.put:
      return _put(context, id);
    default:
      return Response(body: 'Route not found', statusCode: 400);
  }
}

Future<Response> _get(RequestContext context, String id) async {
  var app = await initApp();
  final firebase =
      FirebaseDatabase(app: app, databaseURL: Configurations.databaseUrl);
  final db = firebase.reference().child(id);
  var user = await db.get();
  if (user != null) {
    return Response(body: json.encode(user));
  } else {
    return Response(body: 'Usuário não cadastrado', statusCode: 400);
  }
}

Future<Response> _put(RequestContext context, String id) async {
  var app = await initApp();
  final firebase =
      FirebaseDatabase(app: app, databaseURL: Configurations.databaseUrl);
  final db = firebase.reference().child(id);
  var user = await db.get();
  if (user != null) {
    final request = context.request;
    final body = await request.body();
    final payload = json.decode(body);
    var name = payload["name"];
    var password = payload["password"];
    var email = payload["email"];
    if (name != null) {
      user["name"] = name;
    }
    if (password != null) {
      user["password"] = password;
    }
    if (email != null) {
      user["email"] = email;
    }
    await db.update({
      "name": user["name"],
      "email": user["email"],
      "password": user["password"]
    });
    return Response(body: 'Usuário atualizado');
  } else {
    return Response(body: 'Usuário não cadastrado', statusCode: 400);
  }
}

Future<Response> _delete(RequestContext context, String id) async {
  var app = await initApp();
  final firebase =
      FirebaseDatabase(app: app, databaseURL: Configurations.databaseUrl);
  final db = firebase.reference().child(id);
  var user = await db.get();
  if (user != null) {
    await db.remove();
    return Response(body: 'Usuário apagado');
  } else {
    return Response(body: 'Usuário não cadastrado', statusCode: 400);
  }
}
