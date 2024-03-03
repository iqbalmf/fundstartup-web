import 'package:dio/dio.dart';
import 'package:fundstartup_app/data/datasource/user_remote_datasource.dart';
import 'package:fundstartup_app/data/models/user_model_input.dart';
import 'package:fundstartup_app/domain/repository/user_repository.dart';
import 'package:fundstartup_app/utils/api_helper.dart';
import 'package:fundstartup_app/utils/network/network_client.dart';
import 'package:fundstartup_app/utils/network_info.dart';
import 'package:mockito/annotations.dart';

/**
 * Created by IqbalMF on 2024.
 * Package helper
 */

@GenerateMocks(
  [UserRepository, UserRemoteDataSource, NetworkInfo, UserModelInput, NetworkClient],
  customMocks: [MockSpec<Dio>(as: #MockDioClient)],
)
void main() {}
