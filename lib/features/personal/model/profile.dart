class Profile {
  int? statusCode;
  String? message;
  List<Result>? result;

  Profile({this.statusCode, this.message, this.result});

  Profile.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    if (json['result'] != null) {
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    } else {
      result = null;
    }
  }
}

class Result {
  String? username;
  String? email;

  Result({this.username, this.email});

  Result.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
  }
}
