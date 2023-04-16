import 'package:dotenv/dotenv.dart';
import 'package:firebase_dart/core.dart';

var env = DotEnv(includePlatformEnvironment: true)..load();

class Configurations {
  static var databaseUrl = env['DatabaseUrl'];
  static var firebaseConfig = {
    'apiKey': env['ApiKey'],
    'authDomain': env['AuthDomain'],
    'projectId': env['ProjectId'],
    'storageBucket': env['StorageBucket'],
    'messagingSenderId': env['MessagingSenderId'],
    'appId': env['AppId'],
  };
}

Future<FirebaseApp> initApp() async {
  late FirebaseApp app;
  try {
    app = Firebase.app();
  } catch (e) {
    app = await Firebase.initializeApp(
        options: FirebaseOptions.fromMap(Configurations.firebaseConfig));
  }
  return app;
}
