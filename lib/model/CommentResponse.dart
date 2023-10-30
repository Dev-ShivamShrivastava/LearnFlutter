import 'dart:convert';


List<CommentResponse> commentResponseFromJson(String str) => List<CommentResponse>.from(json.decode(str).map((x) => CommentResponse.fromJson(x)));

String commentResponseToJson(List<CommentResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentResponse {
  int postId;
  int id;
  String name;
  String email;
  String body;

  CommentResponse({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) => CommentResponse(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}