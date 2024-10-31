import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meettown/res/global.dart';

dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        if (responseJson["status"] == false) {
          Message('Error', responseJson["message"]);
        } else {
          Message('Success', responseJson["message"]);
        }

        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);

        Message('Error', responseJson["message"]);

        return responseJson;

      default:
        dynamic responseJson = jsonDecode(response.body);

        Message('Error', responseJson["message"].toString());
      
    }
  }
