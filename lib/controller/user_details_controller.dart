import 'dart:convert';

import 'package:get/get.dart';
import 'package:test_users/utils/app_constants.dart';

import '../models/user_model.dart';
import '../utils/api_manger.dart';

class UserDetailsController extends GetxController {
  UserDetailsController(this.id){
    load();
  }

  int id;

  bool refreshingData = true;

  UserModel userModel = UserModel(id: -1, name: '', username: '', email: '', address: Address(street: '', suite: '', city: '', zipcode: '', geo: Geo(lat: '', lng: '')), phone: '', website: '', company: Company(name: '', catchPhrase: '', bs: ''));

  void load() async {
    refreshingData = true;

    update();

    await getData('${AppConstants.domain}${AppConstants.userDetails}/$id').then((response){
      if(response.statusCode == 200){
        userModel = UserModel.fromJson(jsonDecode(response.body));
      }else{
        userModel = UserModel(id: -1, name: '', username: '', email: '', address: Address(street: '', suite: '', city: '', zipcode: '', geo: Geo(lat: '', lng: '')), phone: '', website: '', company: Company(name: '', catchPhrase: '', bs: ''));
      }
    });

    refreshingData = false;

    update();
  }
}
