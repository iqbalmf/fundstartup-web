import 'package:equatable/equatable.dart';

/**
 * Created by IqbalMF on 2024.
 * Package domain.entities
 */

class UserEntity extends Equatable {
  final int? idUser;
  final String? name;
  final String? occupation;
  final String? email;
  final String? token;
  final String? avatarImage;

  UserEntity({ this.idUser,  this.name,  this.occupation,  this.email,  this.token,  this.avatarImage});

  @override
  List<Object?> get props => [
        idUser,
        name,
        occupation,
        email,
        token,
        avatarImage,
      ];
}
