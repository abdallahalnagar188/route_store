import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String accessToken;  // new field

  UserModel({
    required String id,
    required String name,
    required String email,
    required this.accessToken,
  }) : super(id: id, name: name, email: email,accessToken: accessToken);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      accessToken: json['access_token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'access_token': accessToken,
    };
  }
}
