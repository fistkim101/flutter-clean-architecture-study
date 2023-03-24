import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkStatus {
  Future<bool> get isConnected;
}

class NetworkStatusImpl implements NetworkStatus {
  final DataConnectionChecker _dataConnectionChecker;

  NetworkStatusImpl(this._dataConnectionChecker);

  @override
  Future<bool> get isConnected => _dataConnectionChecker.hasConnection;
}
