import 'package:fundstartup_app/data/models/user_model_input.dart';
import 'package:fundstartup_app/utils/api_helper.dart';

import '../models/user_model.dart';

/**
 * Created by IqbalMF on 2024.
 * Package data.datasource
 */
abstract class UserRemoteDataSource {
  Future<UserModel> getUserLogin(UserModelInput input);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiHelper _apiHelper;

  UserRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<UserModel> getUserLogin(UserModelInput input) async {
    var result = await _apiHelper.request('POST', 'sessions',
        contentType: 'application/json');
    return result;
  }
}
