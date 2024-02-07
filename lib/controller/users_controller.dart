import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_users/utils/app_constants.dart';

import '../models/user_model.dart';
import '../utils/api_manger.dart';

class UsersController extends GetxController implements GetxService{
  UsersController() {
    load();
  }

  bool refreshingData = true;

  List<UserModel> users = [];

  void load() async {
    refreshingData = true;

    users.clear();

    update();

    try{
      await getData('${AppConstants.domain}${AppConstants.usersAPI}').then((response){
        if(response.statusCode == 200){
          users = jsonDecode(response.body).map<UserModel>((data) => UserModel.fromJson(data)).toList();
        }else{
          users = [];
        }
      });
    }catch(e){
      const snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text('An Error Occurred'),
      );
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    }

    refreshingData = false;

    update();
  }
}
