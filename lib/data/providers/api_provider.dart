import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:plan_execute/Ui/utils.dart';
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
  Future updateprofiles(String email, String name) async {

    final res = await _putWithFormData(
        update_profile, {'name': name, 'email': email});
    print(res.data.toString());
    if (res.statusCode == 200) {
      return res.data;
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

  Future userprofile() async {
    final res = await _postWithFormData(me, {});
    if (res.statusCode == 200) {
      log(res.data.toString());
      return UserData.fromJson(res.data);
    } else {
      return ResponseError(
        message: res.data['message'],
      );
    }
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

  Future<Response> _deleteApi(String apiend, {Map<String, dynamic>? map}) {
    return _dio.delete(apiend, queryParameters: map);
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

  Future addrule(String objective_id, String content) async {
    final response = await _postWithFormData(
      keyresult,
      {"objective_id": objective_id, "content": content},
    );
    print(response.data);
    if (response.statusCode == 200) {
      return response.data['data'];
    }
    return ResponseError()
      ..message = response.data['message'] ?? "Something went wrong";
  }

  Future updaterule(String key_id, String completed, String content) async {
    final response = await _putWithFormData(
      keyresult + "/" + key_id,
      {"completed": completed, "content": content},
    );
    print("update " + response.data.toString());
    if (response.statusCode == 200) {
      print("update data " + response.data['data'].toString());
      return response.data['data'];
    }
    return ResponseError()
      ..message = response.data['message'] ?? "Something went wrong";
  }

  Future logout() async {
    final response = await _postWithFormData(logoutEnd, {});
    print(response.data);
  }

  deletTeam(TeamModel model) {}

  Future createobjective(String userid, String name, String due_date,
      String description, List<int> allowuser) async {
    final response = await _postWithFormData(createobjectives, {
      "user_id": userid,
      "name": name,
      "description": description,
      'due_date': due_date,
      for (int a = 0; a < allowuser.length; a++)
        'allowed_users[$a]': allowuser[a],
    });
    print(response.data.toString());
    if (response.statusCode == 200) {
      return response.data["data"];
    }
    return ResponseError()
      ..message = response.data['message'] ?? "Something went wrong";
  }

  Future viewobjective(String obj_id) async {
    final response = await _getApi(viewobjectiv + "/" + obj_id, map: {});
    print(response.data.toString());
    if (response.statusCode == 200) {
      return response.data['data']["0"];
    }
    return ResponseError()
      ..message = response.data['message'] ?? "Something went wrong";
  }

  Future deleteobjective(String obj_id) async {
    final response = await _deleteApi(deleteobjectiv + "/" + obj_id, map: {});
    print(response.data.toString());
    if (response.statusCode == 200) {
      return response.data;
    }
    return ResponseError()
      ..message = response.data['message'] ?? "Something went wrong";
  }

  Future deletekeyresult(String key_id) async {
    final response = await _deleteApi(keyresult + "/" + key_id, map: {});
    print(response.data.toString());
    if (response.statusCode == 200) {
      return response.data;
    }
    return ResponseError()
      ..message = response.data['message'] ?? "Something went wrong";
  }

  Future objective(
      {String? search, String? completed, String? due_range}) async {
    final response = await _getApi(
      allobjectives,
      map: {
        "search": search,
        "completed": completed,
        "due_range": due_range,
      },
    );
    print(response.data.toString());
    if (response.statusCode == 200) {
      return response.data['data']['objectives']['data'];
    }
    return ResponseError()
      ..message = response.data['message'] ?? "Something went wrong";
  }

  Future Currentteam() async {
    final response = await _getApi(currentteam, map: {});
    print(response.data.toString());
    if (response.statusCode == 200) {
      return response.data["data"]["all_users"];
    }
  }

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

  Future fetchInviteList() async {}

  // final response = await _postWithFormData(fe, map)

  Future<Response> _putWithFormData(
      String apiEnd, Map<String, dynamic>? map) async {
    FormData d = FormData.fromMap(map ?? {});
    return _dio.put(apiEnd, data: d);
  }

  Future updateTeam(String name) async {
    // final res = await _putWithFormData(editTeam, {'name': name});

    final res = await _dio.put(editTeam,
        data: {'name': name},
        options: Options(contentType: 'application/x-www-form-urlencoded'));
    if (res.statusCode == 200) {
      return true;
    }
    return res.data['errors']['name'][0];
  }

  Future fetchCurrentMembers() async {
    final res = await _getApi(currentTeamMember);
    if (res.statusCode == 200) {
      return res.data['data']['all_users'];
    }
    return ResponseError(message: "Something went wrong");
  }
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
      "Authorization": "Bearer 53|Osbw5VlsZd2kyi7Mgvxp3GaArSPqc3N2jOukGJd5",
    };
    return super.onRequest(options, handler);
  }
}
