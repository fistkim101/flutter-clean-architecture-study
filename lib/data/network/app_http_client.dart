import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/app/constants/common_constant.dart';
import 'package:retrofit/retrofit.dart';
import '../responses/user_response.dart';

part 'app_http_client.g.dart';

// TODO : constant
@RestApi(baseUrl: CommonConstant.BASE_URL)
abstract class AppHttpClient {
  factory AppHttpClient(Dio dio, {String baseUrl}) = _AppHttpClient;

  @POST('/user')
  Future<UserRegisterResponse> register(
    @Field('email') String email,
    @Field('password') String password,
    @Field('company') String company,
  );
}

// flutter pub run build_runner build --delete-conflicting-outputs
