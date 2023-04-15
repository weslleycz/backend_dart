import 'package:firebase_dart/core.dart';

class Configurations {
  static const databaseUrl =
      'https://backend-dart-e5e1d-default-rtdb.firebaseio.com/';
  static const firebaseConfig = {
    'apiKey': 'AIzaSyCRhvb7RuPGm1rflxRA7aeMk0zOrQsNaTk',
    'authDomain': 'backend-dart-e5e1d.firebaseapp.com',
    'projectId': 'backend-dart-e5e1d',
    'storageBucket': 'backend-dart-e5e1d.appspot.com',
    'messagingSenderId': '972853829213',
    'appId': '1:972853829213:web:34d6c6111f79753880f7b4',
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
