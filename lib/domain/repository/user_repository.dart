import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';

import '../../data/requests/user_register_request.dart';
import '../model/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> register(
      UserRegisterRequest registerRequest);
}
