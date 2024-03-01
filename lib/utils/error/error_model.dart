/**
 * Created by IqbalMF on 2024.
 * Package utils.error
 */

class ErrorModel {
  String responseCode;
  String responseMessage;

  ErrorModel({
    this.responseCode = "-1",
    this.responseMessage = "",
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
        responseCode: json['responseCode'],
        responseMessage: json['responseMessage']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['responseCode'] = responseCode;
    data['responseMessage'] = responseMessage;
    return data;
  }
}
