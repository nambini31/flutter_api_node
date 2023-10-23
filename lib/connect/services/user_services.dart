import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_api_node/connect/models/api_response.dart';
import 'package:flutter_api_node/connect/models/user.dart';
import 'package:flutter_api_node/connect/utils/config.dart';

// Login
Future<ApiResponse> login (String email, String password) async {
    ApiResponse apiResponse = ApiResponse();
    try{
        final response = await http.post(
            Uri.parse(loginURL),
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Bridge-Version": "2021-06-01",
                "Client-Id": clientId,
                "Client-Secret": clientSecret
            },
            body: jsonEncode({'email': email, 'password': password})
        );

        switch(response.statusCode){
            case 200:
                try {
                    apiResponse.data = User.fromJson(jsonDecode(response.body));
                } catch (e) {
                    print("Error parsing JSON: $e");
                }
                break;
            case 401:
                apiResponse.error = jsonDecode(response.body)['message'];
                break;
            case 422:
                final errors = jsonDecode(response.body)['errors'];
                apiResponse.error = errors[errors.keys.elementAt(0)][0];
                break;
            case 403:
                apiResponse.error = jsonDecode(response.body)['message'];
                break;
            default:
                apiResponse.error = somethingWentWrong;
                break;
        }
    }
    catch(e){
        apiResponse.error = serverError;
    }

    return apiResponse;
}

// Register
Future<ApiResponse> register (String email, String password) async {
    ApiResponse apiResponse = ApiResponse();
    try{
        final response = await http.post(
            Uri.parse(registerURL),
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Bridge-Version": "2021-06-01",
                "Client-Id": clientId,
                "Client-Secret": clientSecret
            },
            body: jsonEncode({'email': email, 'password': password})
        );
        switch(response.statusCode){
            case 201:
                try {
                    apiResponse.data = User.fromJson(jsonDecode(response.body));
                } catch (e) {
                    print("Error parsing JSON: $e");
                }
                break;
            case 401:
                apiResponse.error = jsonDecode(response.body)['message'];
                break;
            case 403:
                apiResponse.error = jsonDecode(response.body)['message'];
                break;
            case 409:
                apiResponse.error = jsonDecode(response.body)['message'];
                break;
            case 422:
                final errors = jsonDecode(response.body)['errors'];
                apiResponse.error = errors[errors.keys.elementAt(0)][0];
                break;
            default:
                apiResponse.error = somethingWentWrong;
                break;
        }
    }
    catch(e){
        apiResponse.error = serverError;
    }

    return apiResponse;
}

// get token
Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token') ?? '';
}

// get user id
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

// logout
Future<bool> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('token');
    await pref.remove('userId');
    await pref.remove('prefill_email');
    return true;
}