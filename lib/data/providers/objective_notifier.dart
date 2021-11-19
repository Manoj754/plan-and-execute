
import 'package:plan_execute/data/models/currentteam_model.dart';
import 'package:plan_execute/data/models/error_model.dart';
import 'package:plan_execute/data/models/objectivemodel.dart';
import 'package:plan_execute/data/providers/base_notifier.dart';

class ObjectiveNotifier extends BaseNotifier {
  int selectedStatus = 0;
  int selectedrange = 0;
  ObjectiveModel? currentObejctive;
  OtherKeyResults? currentkeyresult;
  List<ObjectiveModel> objectivemodel = [];
  List<Currentteam> currentteammodel = [];

  ObjectiveModel? model;

  ObjectiveNotifier() {
    load();
    currentteam();
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

  setCurrentObjective(ObjectiveModel objectitem) {
    this.currentObejctive = objectitem;
    notifyListeners();
  }

  setCurrentkeyresult(OtherKeyResults objectitem) {
    this.currentkeyresult = objectitem;
    notifyListeners();
  }

  keyaddrule(String objective_id, String content) async {
    final response = await apiProvider.addrule(objective_id, content);
    if (!(response is ResponseError)) {
      print(response.toString());
      notifyListeners();
    }

  }

  updatekeyrule(String keyid, String completed, String content) async {
    final response = await apiProvider.updaterule(keyid, completed, content);
    if (!(response is ResponseError)) {
      print(response.toString());
      notifyListeners();
    }

  }

  createobjective(
      String userid, String name, String duedate, String description) async {
    final response = await apiProvider
        .createobjective(userid, name, duedate, description, {});
    if (!(response is ResponseError)) {
      print(response.toString());

      notifyListeners();
    }
  }

  viewobjective(String object_id) async {
    final response = await apiProvider.viewobjective(object_id);
    if (!(response is ResponseError)) {
      print(response.toString());
      model = ObjectiveModel.fromJson(response);
      notifyListeners();
    }
  }

  deleteobject(String object_id) async {
    final response = await apiProvider.deleteobjective(object_id);
    if (!(response is ResponseError)) {
      print(response.toString());
      notifyListeners();
    }
  }

  deletekeyresult(String key_id) async {
    final response = await apiProvider.deletekeyresult(key_id);
    if (!(response is ResponseError)) {
      print(response.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  currentteam() async {
    final response = await apiProvider.Currentteam();
    if (!(response is ResponseError)) {
      print(response.toString());

      currentteammodel.addAll(
          (response as List).map((e) => Currentteam.fromJson(e)).toList());
    }
  }
}
