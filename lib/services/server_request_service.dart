import 'dart:convert';
import 'dart:developer';
import 'package:cine_stream/constants/api_constant.dart';
import 'package:http/http.dart' as http;

class ServerRequest {

  static String baseUrl = ApiConstant.baseUrl;

  static final Map<String, String> basicHeaders =  {
    'Accept':'application/json',
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static Map<String, String> tokenHeaders =  {};

  static const String noInternetMessage =
      'Connection to API server failed due to internet connection';


  static Future<dynamic> getData(String path) async {
    String getUrl = baseUrl + path;
    Map<String, String> headers = tokenHeaders.isEmpty?basicHeaders:tokenHeaders;

    try {
      http.Response response = await http
          .get(Uri.parse(getUrl), headers: headers)
          .timeout(const Duration(seconds: 30));
      return response;
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<dynamic> postData(String path, dynamic body) async {
    String postUrl = baseUrl + path;
    Map<String, String> headers = tokenHeaders.isEmpty?basicHeaders:tokenHeaders;

    try {
      http.Response response = await http
          .post(Uri.parse(postUrl), headers: headers, body: body)
          .timeout(const Duration(seconds: 30));
      return response;
    } on Exception catch (_) {
      print("exception occurred");
      return null;
    }
  }

  static Future<dynamic> putData(String path, dynamic body) async {
    String putUrl = baseUrl + path;
    Map<String, String> headers = tokenHeaders.isEmpty?basicHeaders:tokenHeaders;

    try {
      http.Response response = await http
          .put(Uri.parse(putUrl), headers: headers, body: body)
          .timeout(const Duration(seconds: 30));
      return response;
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<dynamic> patchData(String path, dynamic body) async {
    String updateUrl = baseUrl + path;
    Map<String, String> headers = tokenHeaders.isEmpty?basicHeaders:tokenHeaders;

    try {
      http.Response response = await http
          .patch(Uri.parse(updateUrl), headers: headers, body: body)
          .timeout(const Duration(seconds: 30));
      return response;
    } on Exception catch (_) {
      log("Exception Occurred in server request");
      return null;
    }
  }

  static Future<dynamic> deleteData(String path) async {
    String deleteUrl = baseUrl + path;
    Map<String, String> headers = tokenHeaders.isEmpty?basicHeaders:tokenHeaders;

    try {
      http.Response response = await http
          .delete(Uri.parse(deleteUrl), headers: headers)
          .timeout(const Duration(seconds: 30));
      return response;
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<dynamic> formData({
    required String method,
    required String path,
    Map<String, String>? textFields,
    List<http.MultipartFile>? fileFields,
  }) async {
    String postUrl = baseUrl + path;
    Map<String, String> headers = tokenHeaders.isEmpty?basicHeaders:tokenHeaders;

    http.MultipartRequest request = http.MultipartRequest(method, Uri.parse(postUrl));
    request.headers.addAll(headers);

    if (textFields != null) {
      request.fields.addAll(textFields);
    }
    if (fileFields != null) {
      request.files.addAll(fileFields);
    }
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(await response.stream.bytesToString());
        return responseBody;
      } else if (response.statusCode == 413) {
        print('file is too large');
        return null;
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  void handleErrorResponse(http.Response response) {
    if (response.statusCode == 400) {
    } else if (response.statusCode == 401) {
    } else if (response.statusCode == 403) {
    } else if (response.statusCode == 404) {
    } else if (response.statusCode == 408) {
    } else if (response.statusCode == 500) {
    } else if (response.statusCode == 503) {
    } else if (response.statusCode == 504) {
    } else {}
  }
}