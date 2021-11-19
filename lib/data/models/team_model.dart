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
    email = "email@email.com";
    url =
        "https://images.unsplash.com/photo-1633114129669-78b1ff09902b?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80";
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

  @override
  bool operator ==(other) => (other is TeamModel) && (other.id == this.id);

  @override
  int get hashCode => this.id;
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
