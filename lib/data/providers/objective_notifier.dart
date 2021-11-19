import 'dart:convert';

import 'package:plan_execute/data/models/Keyresult.dart';
import 'package:plan_execute/data/models/error_model.dart';
import 'package:plan_execute/data/models/objectivemodel.dart';
import 'package:plan_execute/data/providers/base_notifier.dart';

class ObjectiveNotifier extends BaseNotifier {
  int selectedStatus = 0;
  int selectedrange = 0;
  List<ObjectiveModel> objectivemodel = [];

  ObjectiveNotifier() {
    load();
  }

  load({String? search, String? completed, String? due_range}) async {
    final response = await apiProvider.objective(
        search: search, completed: completed, due_range: due_range);
    if (!(response is ResponseError)) {
      print(response.toString());
      objectivemodel = [];
      // ObjectiveModel objectModel = ObjectiveModel.fromJson(response);
      objectivemodel
          .addAll((response as List).map((e) => ObjectiveModel.fromJson(e)));
      notifyListeners();
    }
  }

  keyaddrule(String objective_id, String content) async {
    final response = await apiProvider.addrule(objective_id, content);
    if (!(response is ResponseError)) {
      print(response.toString());
    }
  }

  updatekeyrule(String keyid, String completed, String content) async {
    final response = await apiProvider.updaterule(keyid, completed, content);
    if (!(response is ResponseError)) {
      print(response.toString());
    }
  }
}
