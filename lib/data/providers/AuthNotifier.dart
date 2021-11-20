import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:plan_execute/Ui/utils.dart';
import 'package:plan_execute/data/models/error_model.dart';
import 'package:plan_execute/data/models/user_model.dart';
import 'package:plan_execute/data/providers/api_provider.dart';
import 'package:plan_execute/data/providers/base_notifier.dart';
import 'package:plan_execute/data/providers/sp_helper.dart';

class AuthNotifier extends BaseNotifier {
  UserData? userData;

  AuthNotifier() {
    final stringData = SpHelper.getString(pref_user_data);
    print(stringData);
    if (stringData != "") {
      userData = UserData.fromJson(jsonDecode(stringData));
    }
  }

  ApiProvider _apiProvider = ApiProvider();

  Future login(String email, String password, bool isRemmberme) async {
    print("login");
    final response = await _apiProvider.login(email, password);
    if (response is UserData) {
      userData = response;
      if (isRemmberme)
        SpHelper.setString(pref_user_data, jsonEncode(userData!.toJson()));
    }
    if (response is ResponseError) {
      showToast(response.message);
    }
    notifyListeners();
  }

  Userprofile() async {
    final response = await apiProvider.userprofile();
    if (response is UserData) {
      userData = response;
    }
    if (response is ResponseError) {
      showToast(response.message);
    }
  }

  updateprofile(String name, String email) async {
    final response = await apiProvider.updateprofiles(email, name);
    if (!(response is ResponseError)) {
      showToast(response.toString());
    }
  }

  Future register(
      String name, String email, String password, bool isAgree) async {
    final resposne =
        await _apiProvider.register(name, email, password, isAgree);
    if (resposne == true) {
      return true;
    } else if (resposne is ResponseError) {
      
      showToast(resposne.message);
    }
  }

  logout() async {
    userData = null;
    await _apiProvider.logout();
    SpHelper.clear();
    notifyListeners();
  }
}
