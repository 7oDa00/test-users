import 'dart:convert';

import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'app_constants.dart';

Future<Response> getData(String url) async {
  try {
    var uri = Uri.parse(url);
    var response = await http.get(uri).timeout(const Duration(seconds: 30));

    if(response.statusCode == AppConstants.successStatusCode){
      return response;
    }else if(response.statusCode == AppConstants.unauthenticatedStatusCode){
      return Response(
          '',
          AppConstants.unauthenticatedStatusCode
      );
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

