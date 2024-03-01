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

class NewUserModelInput{
  String name;
  String email;
  String password;
  String occupation;
  NewUserModelInput(this.name, this.email, this.password, this.occupation);

  Map<String, dynamic> tojson(){
    return {
      'name': name,
      'email': email,
      'password': password,
      'occupation': occupation
    };
  }

}