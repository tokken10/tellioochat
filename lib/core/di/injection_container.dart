import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../network/network_info.dart';
import '../../features/chat/chat_injection.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _registerCore();
  await registerChatFeatureDependencies(serviceLocator);
}

void _registerCore() {
  serviceLocator.registerLazySingleton<http.Client>(() => http.Client());
  serviceLocator.registerLazySingleton<InternetConnection>(InternetConnection.new);
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(serviceLocator()),
  );
}
