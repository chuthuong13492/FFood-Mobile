import 'package:ffood/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future setup() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void createRouteBindings() async {
  
}
