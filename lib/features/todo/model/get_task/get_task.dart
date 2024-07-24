class Task {
  int? statusCode;
  String? message;
  List<CResult>? result;

  Task({this.statusCode, this.message, this.result});

  Task.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result!.add(CResult.fromJson(v));
      });
    }
  }
}

class CResult {
  int? id;
  String?title;
  String? content;
  String? createdAt;
  String? updatedAt;

  CResult({this.id, this.title, this.content, this.createdAt, this.updatedAt});

  CResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
