import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/data_source/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/mapper/user_mapper.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:flutter_clean_architecture/data/network/network_status.dart';
import 'package:flutter_clean_architecture/data/requests/user_register_request.dart';
import 'package:flutter_clean_architecture/data/responses/user_response.dart';
import 'package:flutter_clean_architecture/domain/repository/user_repository.dart';

import '../../domain/model/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final NetworkStatus _networkStatus;
  final RemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._networkStatus, this._remoteDataSource);

  @override
  Future<Either<Failure, UserModel>> register(
      UserRegisterRequest request) async {
    if (await _networkStatus.isConnected) {
      try {
        UserRegisterResponse response =
            await _remoteDataSource.register(request);
        return Right(response.toDomain());
      } on DioError catch (exception) {
        // TODO : statusCode 별 에러 처리
        int? statusCode = exception.response?.statusCode;
        return const Left(Failure(statusCode: 400, message: "logic error"));
      }
    } else {
      // connection error
      return const Left(Failure(statusCode: 500, message: "server error"));
    }
  }
}
