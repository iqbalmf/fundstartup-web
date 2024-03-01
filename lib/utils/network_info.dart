import 'package:internet_connection_checker/internet_connection_checker.dart';

/**
 * Created by IqbalMF on 2024.
 * Package utils
 */
abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker? connectionChecker;

  NetworkInfoImpl({this.connectionChecker});

  @override
  Future<bool>? get isConnected {
    return connectionChecker?.hasConnection ?? Future.value(false);
  }
}