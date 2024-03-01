/**
 * Created by IqbalMF on 2024.
 * Package utils.network.config
 */

class Endpoints {
  static const String baseURL = "localhost:8081";
  static const String login = '/api/v1/sessions';
  static const String fetchUser = '/api/v1/users/fetch/';
  static const String user = '/api/v1/users';
  static const String avatarImage = '/api/v1/avatars';
  static const String emailChecker = '/api/v1/email_checkers';


  static const int receiveTimeout = 8000;
  static const int connectionTimeout = 8000;
}