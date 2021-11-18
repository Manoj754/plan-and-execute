class TeamModel {
  late int id;
  late int userId;
  late String name;
  late bool personalTeam;
  late String createdAt;
  late String updatedAt;
  late String email;
  late String url;

  TeamModel(
      {this.id = 0,
      this.userId = 0,
      this.name = "",
      this.email = "",
      this.personalTeam = false,
      this.createdAt = "",
      this.url = "",
      this.updatedAt = ""});

  TeamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['user_id'] ?? 0;
    name = json['name'] ?? "";
    personalTeam = json['personal_team'] ?? false;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['personal_team'] = this.personalTeam;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

// class TeamModel {
//   String url;
//   String name;
//   String email;
//   String owner;
//   TeamModel({
//     this.email = "",
//     this.name = "",
//     this.url = "",
//     this.owner = "Super admin",
//   });
// }
