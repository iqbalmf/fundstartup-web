import 'package:dio/dio.dart';
import 'package:fundstartup_app/data/datasource/user_datasource.dart';
import 'package:fundstartup_app/domain/repository/user_repository.dart';
import 'package:fundstartup_app/utils/api_helper.dart';
import 'package:mockito/annotations.dart';

/**
 * Created by IqbalMF on 2024.
 * Package helper
 */

@GenerateMocks(
  [UserRepository, UserRemoteDataSource],
  customMocks: [MockSpec<Dio>(as: #MockDioClient)],
)
void main() {}
