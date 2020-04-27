import 'dart:convert';
import 'dart:developer';
import 'package:flutterapp01/models/AuthenticateUserRequestDto.dart';
import 'package:flutterapp01/models/AuthenticateUserResponseDto.dart';
import 'package:flutterapp01/utill/AppConstants.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<AuthenticateUserResponseDto> authenticateUser(
      {@required AuthenticateUserRequestDto authenticateUserRequestDto}) async {
    final http.Response response =
        await http.post(AppConstants.BASE_URL + 'authenticateUser',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(authenticateUserRequestDto.toJson()));
    try {
      AuthenticateUserResponseDto apiResponse =
          AuthenticateUserResponseDto.fromJson(json.decode(response.body));
      return apiResponse;
    } catch (error) {
      log(error);
    }
    return null;
  }

  Future<String> authenticated(
      {@required String username, @required String password}) async {
    await Future.delayed(Duration(seconds: 1));
    return "12345678";
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
