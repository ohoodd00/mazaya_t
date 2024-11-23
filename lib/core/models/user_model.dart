import 'package:mazaya/core/constent/user_constants.dart';

class UserModel {
  final int? id;
  final String userName;
  final String password;
  final String? checkAccept;

  UserModel({
    this.id,
    this.checkAccept,
    required this.userName,
    required this.password,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
        id: json[UserConstants.id],
        checkAccept: json[UserConstants.checkAccept],
        userName: json[UserConstants.userName],
        password: json[UserConstants.password]);
  }

  Map<String, dynamic> toJson() {
    return {
      UserConstants.userName: userName,
      UserConstants.password: password,
      UserConstants.checkAccept: checkAccept
    };
  }
}
