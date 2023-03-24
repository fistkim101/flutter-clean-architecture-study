class UserModel {
  final PersonalModel personal;
  final BusinessModel business;

  UserModel(this.personal, this.business);
}

class PersonalModel {
  final String email;
  final String name;

  PersonalModel(this.email, this.name);
}

class BusinessModel {
  final String company;
  final String companyAddress;

  BusinessModel(this.company, this.companyAddress);
}
