class Keyresult {
  String content = "";
  String objectiveId = "";
  int ownerId = 0;
  int teamId = 0;
  int isTeamObjective = 0;
  String updatedAt = "";
  String createdAt = "";
  int id = 0;

  Keyresult.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    objectiveId = json['objective_id'];
    ownerId = json['owner_id'];
    teamId = json['team_id'];
    isTeamObjective = json['is_team_objective'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['objective_id'] = this.objectiveId;
    data['owner_id'] = this.ownerId;
    data['team_id'] = this.teamId;
    data['is_team_objective'] = this.isTeamObjective;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
