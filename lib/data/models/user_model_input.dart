/**
 * Created by IqbalMF on 2024.
 * Package data.models
 */

class UserModelInput{
  String email;
  String password;
  UserModelInput(this.email, this.password);

  Map<String, dynamic> toJson(){
    return {
      'email': email,
      'password': password
    };
  }
}