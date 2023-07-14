import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/core/config.dart';
import 'app/core/injection_container.dart';
import 'firebase_options.dart';

void main() async {
  Config.appFlavor = Flavor.production;
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
