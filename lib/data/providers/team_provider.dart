import 'package:plan_execute/Ui/utils.dart';
import 'package:plan_execute/data/models/error_model.dart';
import 'package:plan_execute/data/models/team_model.dart';
import 'package:plan_execute/data/providers/base_notifier.dart';

class TeamNotifier extends BaseNotifier {
  List<TeamModel> teamModel = [];
  TeamModel? currentTeam;

  TeamNotifier() {
    load();
  }

  load() async {
    final response = await apiProvider.getMyAllTeam();
    if (!(response is ResponseError)) {
      print(response.toString());
      teamModel = [];
      if (response['data']['my_teams'] is List) {
        teamModel.addAll((response['data']['my_teams'] as List)
            .map((e) => TeamModel.fromJson(e))
            .toList());
      }
      if (response['data']['current_team'] != null) {
        currentTeam = TeamModel.fromJson(response['data']['current_team']);
      }
      notifyListeners();
      // teamModel.addAll(iterable)
    }
  }

  void setCurrentTeam(TeamModel teamModel) {
    this.currentTeam = teamModel;
    apiProvider.switchTeam(teamModel);
    notifyListeners();
  }

  void deleteTeam(TeamModel model) {
    // apiProvider.
  }
  Future<bool> creteTeam(
    String name,
  ) async {
    final res = await apiProvider.createTeam(name);
    if (!(res is ResponseError)) {
      teamModel.add(TeamModel.fromJson(res));
      showToast("Team created Successfully");
      notifyListeners();
      return true;
    } else {
      showToast(res.message);
      return false;
    }
  }

  Future invitTeamMember(String email, String role) async {
    final res = await apiProvider.inviteMember(email, role);
    if (res is ResponseError) {
      showToast(res.message);
      return false;
    }
    showToast(res.toString());
    return true;
  }

  Future fetchInviteList() async {
    apiProvider.fetchInviteList();
  }
}
