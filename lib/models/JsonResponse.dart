import 'dart:convert';

JsonResponse jsonResponseFromJson(String str) => JsonResponse.fromJson(json.decode(str));


class JsonResponse {
  bool status;
  int statusCode;
  String message;
  dynamic data;

  JsonResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory JsonResponse.fromJson(Map<String, dynamic> json) => JsonResponse(
    status: json["status"],
    statusCode: json["status_code"],
    message: json["message"],
    data: json["data"],
  );
}
