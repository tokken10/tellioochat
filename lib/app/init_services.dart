import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart'; // 👈 Add this
import 'package:flutter_dotenv/flutter_dotenv.dart'; // 👈 Keep dotenv

import '../core/di/injection_container.dart';

Future<void> initServices() async {
  // Set UI mode and orientation
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Only load .env in debug mode
  if (!kReleaseMode) {
    await dotenv.load(fileName: ".env");
  }

  await initDependencies();
}
