// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'app/bloc_providers.dart';
import 'app/init_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(
    MultiBlocProvider(
      providers: getBlocProviders(),
      child: MyApp(),
    ),
  );
}