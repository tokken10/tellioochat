import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection _connection;

  NetworkInfoImpl(this._connection);

  @override
  Future<bool> get isConnected async => _connection.hasInternetAccess;
}
