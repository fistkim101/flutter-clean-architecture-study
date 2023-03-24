import 'package:flutter_clean_architecture/data/network/app_http_client.dart';
import 'package:flutter_clean_architecture/data/requests/user_register_request.dart';
import 'package:flutter_clean_architecture/data/responses/user_response.dart';

abstract class RemoteDataSource {
  Future<UserRegisterResponse> register(UserRegisterRequest request);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppHttpClient _appHttpClient;

  RemoteDataSourceImpl(this._appHttpClient);

  @override
  Future<UserRegisterResponse> register(UserRegisterRequest request) async {
    return await _appHttpClient.register(
      request.email,
      request.password,
      request.company,
    );
  }
}
