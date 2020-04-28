import 'package:flutterapp01/models/FilterRequestDto.dart';
import 'package:flutterapp01/models/FilterResponseDto.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:flutterapp01/models/AuthenticateUserRequestDto.dart';
import 'package:flutterapp01/models/AuthenticateUserResponseDto.dart';
import 'package:flutterapp01/utill/AppConstants.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class FilterModelListRepository {
  Future<List<FilterResponseDto>> fetchModelList(
      FilterRequestDto filterRequestDto) async {
    final response = await http.post(AppConstants.BASE_URL + 'filter',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(filterRequestDto.toJson()));
    try {
      List<FilterResponseDto> apiResponse = parseModeList(response.body);
      return apiResponse;
    } catch (error) {
      log(error);
    }
    return null;
  }

  List<FilterResponseDto> parseModeList(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<FilterResponseDto>((json) => FilterResponseDto.fromJson(json))
        .toList();
  }
}
