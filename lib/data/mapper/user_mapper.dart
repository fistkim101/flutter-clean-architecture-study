import '../../domain/model/user_model.dart';
import '../responses/user_response.dart';

// TODO : validation
extension UserRegisterResponseMapper on UserRegisterResponse {
  UserModel toDomain() {
    PersonalModel personal =
        PersonalModel(this.personal!.email!, this.personal!.name!);
    BusinessModel business =
        BusinessModel(this.business!.company!, this.business!.companyAddress!);
    return UserModel(personal, business);
  }
}
