import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}

class NetworkInfoImpl {
  final Connectivity _connectivity = Connectivity();

  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
