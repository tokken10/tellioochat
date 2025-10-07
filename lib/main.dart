// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/bloc_providers.dart';
import 'app/init_services.dart';
import 'core/utils/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await initServices();
  runApp(
    MultiBlocProvider(
      providers: getBlocProviders(),
      child: const MyApp(),
    ),
  );
}
