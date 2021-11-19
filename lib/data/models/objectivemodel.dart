class ObjectiveModel {
  int id = 0;
  int userId = 0;
  int teamId = 0;
  String name = "";
  String description = "";
  String dueDate = "";
  var keyResults;
  int editByUser = 0;
  String allowedUsers = "";
  int parentId = 0;
  String completedNote = "";
  int completed = 0;
  int approved = 0;
  int objectiveType = 0;
  var mailSent;
  String timer = "";
  String completedAt = "";
  String deletedAt = "";
  int status = 0;
  int completedKeyResultCount = 0;
  // List<Null> subObjectives;
  List<OtherKeyResults> otherKeyResults = [];

  ObjectiveModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    teamId = json['team_id'];
    name = json['name'];
    description = json['description'];
    dueDate = json['due_date'];
    keyResults = json['key_results'];
    editByUser = json['edit_by_user'];
    allowedUsers = json['allowed_users'];
    parentId = json['parent_id'];
    completedNote = json['completed_note'];
    completed = json['completed'];
    approved = json['approved'];
    objectiveType = json['objective_type'];
    mailSent = json['mail_sent'];
    timer = json['timer'];
    completedAt = json['completed_at'] != null ? json['completed_at'] : "";
    deletedAt = json['deleted_at'] != null ? json['completed_at'] : "";
    status = json['status'];
    completedKeyResultCount = json['completed_key_result_count'];
    /*if (json['sub_objectives'] != null) {
      subObjectives = new List<Null>();
      json['sub_objectives'].forEach((v) {
        subObjectives.add(new Null.fromJson(v));
      });
    }*/
    if (json['other_key_results'] != null) {
      otherKeyResults = [];
      json['other_key_results'].forEach((v) {
        otherKeyResults.add(new OtherKeyResults.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['user_id'] = this.userId;
  //   data['team_id'] = this.teamId;
  //   data['name'] = this.name;
  //   data['description'] = this.description;
  //   data['due_date'] = this.dueDate;
  //   data['key_results'] = this.keyResults;
  //   data['edit_by_user'] = this.editByUser;
  //   data['allowed_users'] = this.allowedUsers;
  //   data['parent_id'] = this.parentId;
  //   data['completed_note'] = this.completedNote;
  //   data['completed'] = this.completed;
  //   data['approved'] = this.approved;
  //   data['objective_type'] = this.objectiveType;
  //   data['mail_sent'] = this.mailSent;
  //   data['timer'] = this.timer;
  //   data['completed_at'] = this.completedAt;
  //   data['deleted_at'] = this.deletedAt;
  //   data['status'] = this.status;
  //   data['completed_key_result_count'] = this.completedKeyResultCount;
  //   if (this.subObjectives != null) {
  //     data['sub_objectives'] =
  //         this.subObjectives.map((v) => v.toJson()).toList();
  //   }
  //   if (this.otherKeyResults != null) {
  //     data['other_key_results'] =
  //         this.otherKeyResults.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class OtherKeyResults {
  int id = 0;
  int objectiveId = 0;
  int ownerId = 0;
  int teamId = 0;
  var assignUserId;
  String content = "";
  int position = 0;
  int completed = 0;
  int isTeamObjective = 0;
  var dueDate;
  var deletedAt;
  var assignedUser;
  var ownedUser;

  /* OtherKeyResults(
      {this.id,
        this.objectiveId,
        this.ownerId,
        this.teamId,
        this.assignUserId,
        this.content,
        this.position,
        this.completed,
        this.isTeamObjective,
        this.dueDate,
        this.deletedAt,
        this.assignedUser,
        this.ownedUser});*/

  OtherKeyResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectiveId = json['objective_id'];
    ownerId = json['owner_id'];
    teamId = json['team_id'];
    assignUserId = json['assign_user_id'];
    content = json['content'];
    position = json['position'];
    completed = json['completed'];
    isTeamObjective = json['is_team_objective'];
    dueDate = json['due_date'];
    deletedAt = json['deleted_at'];
    assignedUser = json['assigned_user'];
    ownedUser = json['owned_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['objective_id'] = this.objectiveId;
    data['owner_id'] = this.ownerId;
    data['team_id'] = this.teamId;
    data['assign_user_id'] = this.assignUserId;
    data['content'] = this.content;
    data['position'] = this.position;
    data['completed'] = this.completed;
    data['is_team_objective'] = this.isTeamObjective;
    data['due_date'] = this.dueDate;
    data['deleted_at'] = this.deletedAt;
    data['assigned_user'] = this.assignedUser;
    data['owned_user'] = this.ownedUser;
    return data;
  }
}
