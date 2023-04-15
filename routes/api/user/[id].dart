import 'package:dart_frog/dart_frog.dart';
import 'package:firebase_dart/database.dart';

import '../../../servers/firebase.dart';

Object onRequest(RequestContext context, String id) {
  switch (context.request.method) {
    case HttpMethod.delete:
      return _delete(context, id);
    default:
      return Response(body: 'Route not found', statusCode: 400);
  }
}

Future<Response> _delete(RequestContext context, String id) async {
  var app = await initApp();
  final firebase =
      FirebaseDatabase(app: app, databaseURL: Configurations.databaseUrl);
  final db = firebase.reference().child(id);
  var user = await db.get();
  print(user);
  if (user != null) {
    await db.remove();
    return Response(body: 'Usuário apagado');
  } else {
    return Response(
        body: 'Não foi positivável apagar o usuário', statusCode: 400);
  }
}
