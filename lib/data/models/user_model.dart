import 'package:fundstartup_app/domain/entities/user_entity.dart';

/**
 * Created by IqbalMF on 2024.
 * Package data.models
 */

class UserModel extends UserEntity {
  UserModel(
      {required super.idUser,
      required super.name,
      required super.occupation,
      required super.email,
      required super.token,
      required super.avatarImage});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        idUser: json['data']['id'],
        name: json['data']['name'],
        occupation: json['data']['occupation'],
        email: json['data']['email'],
        token: json['data']['token'],
        avatarImage: json['data']['image_url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'id': idUser,
        'name': name,
        'occupation': occupation,
        'email': email,
        'token': token,
        'image_url': avatarImage,
      }
    };
  }

  UserEntity toEntity() {
    return UserEntity(idUser: idUser, name: name, occupation: occupation, email: email, token: token, avatarImage: avatarImage);
  }
}
