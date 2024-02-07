import 'dart:async';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'app_constants.dart';

Future<Response> getData(String url) async {
  try {
    var uri = Uri.parse(url);
    var response = await http.get(uri).timeout(const Duration(seconds: 5));

    if(response.statusCode == AppConstants.successStatusCode){
      return response;
    }else{
      return Response(
          '',
          AppConstants.exceptionStatusCode
      );
    }
  } catch(e) {
    return Response(
        '',
        AppConstants.exceptionStatusCode
    );
  }
}

