import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:plan_execute/data/models/error_model.dart';
import 'package:plan_execute/data/models/team_model.dart';
import 'package:plan_execute/data/models/user_model.dart';
import 'package:plan_execute/data/providers/apiEndes.dart';
import 'package:plan_execute/data/providers/sp_helper.dart';

class ApiProvider {
  static final ApiProvider _instance = ApiProvider.private();
  ApiProvider.private();
  factory ApiProvider() {
    return _instance;
  }
  // Dio _dio = Dio()..options.baseUrl = baseUrl;
  Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      validateStatus: (state) => true,
    ),
  )..interceptors.add(CustomInterceptor());
  Future login(String email, String password) async {
    // final response = http.post(Uri.parse(baseUrl + loginEnd),
    //     body: {'email': email, 'password': password});
    // print(response.toString());
    final res = await _postWithFormData(
        loginEnd, {'email': email, 'password': password});
    print(res.data.toString());
    if (res.statusCode == 200) {
      return UserData.fromJson(res.data['user']);
    } else {
      return ResponseError(
        message: res.data['message'],
      );
    }
  }

  Future createTeam(String name) async {
    final res = await _postWithFormData(createTeamEnd, {
      'name': name,
    });
    if (res.statusCode == 200) {
      log(res.data.toString());
      return res.data['data'];
    }
    log(res.data.toString());
    return ResponseError(message: res.data['errors']?['name']?[0] ?? "");
  }

  Future getMyAllTeam() async {
    final response = await _getApi(myTeamsEnd);
    if (response.statusCode == 200) {
      return response.data;
    }
    return ResponseError();
  }

  Future<Response> _getApi(String apiend, {Map<String, dynamic>? map}) {
    return _dio.get(apiend, queryParameters: map);
  }

  Future register(
      String name, String email, String password, bool isAgree) async {
    final response = await _postWithFormData(
      registerEnd,
      {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password,
        "terms": isAgree
      },
    );
    print(response.data);
    if (response.statusCode == 200) {
      return true;
    }
    return ResponseError()
      ..message = response.data['message'] ?? "Something went wrong";
  }

  Future logout() async {
    final response = await _postWithFormData(logoutEnd, {});
    print(response.data);
  }

  deletTeam(TeamModel model) {}

  Future<Response> _postWithFormData(
      String apiEnd, Map<String, dynamic>? map) async {
    FormData d = FormData.fromMap(map ?? {});
    return _dio.post(apiEnd, data: d);
  }

  ///// team ///////////
  Future switchTeam(TeamModel teamModel) async {
    final response =
        await _postWithFormData(swicthTeamEnd, {'team_id': teamModel.id});
    if (response.statusCode == 200) {
      log(response.data.toString());
      return;
    }
    log(response.data.toString());
  }

  /////////////// manage Members ////////////
  Future inviteMember(String s, String role) async {
    final response =
        await _postWithFormData(inviteTeam, {'email': s, 'role': role});
    log(response.data.toString());
    if (response.statusCode == 200) {
      return response.data['message'];
    }
    return ResponseError(message: response.data['message']);
  }

  Future fetchInviteList() async {
    // final response = await _postWithFormData(fe, map)
  }

  updateTeam() async {}
}

class CustomInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = SpHelper.getString(pref_access_token);
    if (token != "")
      options.headers = {
        "Authorization": "Bearer $token",
      };
    options.headers = {
      "Authorization": "Bearer 53|Osbw5VlsZd2kyi7Mgvxp3GaArSPqc3N2jOukGJd5"
    };
    return super.onRequest(options, handler);
  }
}
