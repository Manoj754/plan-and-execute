import 'package:plan_execute/Ui/utils.dart';
import 'package:plan_execute/data/models/error_model.dart';
import 'package:plan_execute/data/models/member_model.dart';
import 'package:plan_execute/data/models/team_model.dart';
import 'package:plan_execute/data/providers/base_notifier.dart';

class TeamNotifier extends BaseNotifier {
  List<TeamModel> teamModel = [];
  TeamModel? currentTeam;
  List<MemberModel> currentMembers = [];
  TeamNotifier() {
    load();
    fecthCurrentMembers();
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

  Future<bool> updateTeam(String name) async {
    final res = await apiProvider.updateTeam(name);
    if (res is String) {
      showToast(res);
      return false;
    }
    currentTeam?.name = name;
    notifyListeners();
    showToast("Updated Successfully");
    return true;
  }

  Future fecthCurrentMembers() async {
    final res = await apiProvider.fetchCurrentMembers();
    if (!(res is ResponseError)) {
      currentMembers
          .addAll((res as List).map((e) => MemberModel.fromJson(e)).toList());
      notifyListeners();
    }
  }
}
