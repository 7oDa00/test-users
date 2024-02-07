import 'dart:convert';

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
  UserModel currentUser = UserModel(id: -1, name: '', username: '', email: '', address: Address(street: '', suite: '', city: '', zipcode: '', geo: Geo(lat: '', lng: '')), phone: '', website: '', company: Company(name: '', catchPhrase: '', bs: ''));

  void load() async {
    refreshingData = true;

    update();

    await getData('${AppConstants.domain}${AppConstants.usersAPI}').then((response){
      if(response.statusCode == 200){
        users = jsonDecode(response.body).map<UserModel>((data) => UserModel.fromJson(data)).toList();
      }else{
        users = [];
      }
    });

    refreshingData = false;

    update();
  }
}
