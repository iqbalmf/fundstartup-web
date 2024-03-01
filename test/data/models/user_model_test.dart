import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fundstartup_app/data/models/user_model.dart';
import 'package:fundstartup_app/domain/entities/user_entity.dart';

import '../../helper/json_reader.dart';

/**
 * Created by IqbalMF on 2024.
 * Package models
 */
void main() {
  final tUserModel = UserModel(
      idUser: 20,
      name: "Iqbal Muhammad 2",
      occupation: "Karyawan Swasta",
      email: "iqbalmf68@gmail.com",
      token:
          "xxxTokenxxx",
      avatarImage: "avatar_images/20-FWaB5j-UEAA-_yN.jpeg");

  final tUserEntity = UserEntity(
      idUser: 20,
      name: "Iqbal Muhammad 2",
      occupation: "Karyawan Swasta",
      email: "iqbalmf68@gmail.com",
      token:
          "xxxTokenxxx",
      avatarImage: "avatar_images/20-FWaB5j-UEAA-_yN.jpeg");

  group("to entity", () {
    test("should be a subclass of UserEntity", () async {
      final result = tUserModel.toEntity();
      expect(result, equals(tUserEntity));
    });
  });

  group("from json", () {
    test('should return a valid model from json', () async {
      final Map<String, dynamic> jsonMap = json.decode(jsonReader('user.json'));

      final result = UserModel.fromJson(jsonMap);

      expect(result, tUserModel);
    });
  });

  group("to json", () {
    test("should return a json Map containing the proper data", () async {
      final result = tUserModel.toJson();

      final expectedJsonMap = {
        "data": {
          "id": 20,
          "name": "Iqbal Muhammad 2",
          "occupation": "Karyawan Swasta",
          "email": "iqbalmf68@gmail.com",
          "token":
              "xxxTokenxxx",
          "image_url": "avatar_images/20-FWaB5j-UEAA-_yN.jpeg"
        },
      };

      expect(result, expectedJsonMap);
    });
  });
}
