import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_api_node/connect/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_api_node/connect/utils/config.dart';

Future<ApiResponse> connectToBridge() async{
    ApiResponse apiResponse = ApiResponse();
    SharedPreferences pref = await SharedPreferences.getInstance();
    try{
        String token = await getToken();
        final response = await http.post(
            Uri.parse(connectBridgeURL),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Bridge-Version': '2021-06-01',
                'Authorization': 'Bearer $token',
                'Client-Id': clientId,
                'Client-Secret': clientSecret
            },
            body: jsonEncode({
                'country': 'fr',
                'prefill_email': pref.getString('prefill_email'),
            })
        );

        switch(response.statusCode){
            case 200:
                try {
                    apiResponse.data = jsonDecode(response.body);
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

// get token
Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token') ?? '';
}