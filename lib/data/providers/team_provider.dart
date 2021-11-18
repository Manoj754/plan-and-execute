import 'package:flutter/cupertino.dart';
import 'package:plan_execute/data/models/error_model.dart';
import 'package:plan_execute/data/models/team_model.dart';
import 'package:plan_execute/data/providers/api_provider.dart';
import 'package:plan_execute/data/providers/base_notifier.dart';

class TeamNotifier extends BaseNotifier {
  List<TeamModel> teamModel = [];

  TeamNotifier() {
    load();
  }

  load() async {
    final response = await apiProvider.getMyAllTeam();
    if (!(response is ResponseError)) {
      print(response.toString());
      // teamModel.addAll(iterable)
    }
  }
}
