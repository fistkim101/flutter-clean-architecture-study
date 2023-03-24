import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:flutter_clean_architecture/data/requests/user_register_request.dart';
import 'package:flutter_clean_architecture/domain/model/user_model.dart';
import 'package:flutter_clean_architecture/domain/repository/user_repository.dart';

import 'base_usecase.dart';

class RegisterUseCase extends BaseUseCase<UserRegisterInput, UserModel> {
  final UserRepository _userRepository;

  RegisterUseCase(this._userRepository);

  @override
  Future<Either<Failure, UserModel>> execute(UserRegisterInput input) async {
    return await _userRepository.register(UserRegisterRequest(
        email: input.email,
        password: input.password,
        name: input.name,
        company: input.company));
  }
}

class UserRegisterInput {
  final String email;
  final String password;
  final String name;
  final String company;

  const UserRegisterInput({
    required this.email,
    required this.password,
    required this.name,
    required this.company,
  });
}
