class UserRegisterRequest {
  final String email;
  final String password;
  final String name;
  final String company;

  const UserRegisterRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.company,
  });
}
