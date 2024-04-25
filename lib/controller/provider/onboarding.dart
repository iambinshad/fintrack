import 'dart:developer';

import 'package:fintrack/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class UserProvider extends GetxController {
  User _user = User(
      name: "", email: "", password: "", address: "", type: "", id: "", v: 0,token: "");

  Rx<User> get user => _user.obs;

  setUser(String userr) {
    _user = User.fromJson(userr);
    log(_user.toJson().toString(), name: "User");
  }
}
