class MemberModel {
  late int id;
  late String name;
  late String email;
  late String emailVerifiedAt;
  late int currentTeamId;
  late String profilePhotoPath;
  late String profilePhotoUrl;
  // late Membership membership;

  // MemberModel(
  //     {this.id,
  //     this.name,
  //     this.email,
  //     this.emailVerifiedAt,
  //     this.currentTeamId,
  //     this.profilePhotoPath,
  //     this.profilePhotoUrl,
  //     this.membership});

  MemberModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'] ?? "";
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'] ??
        "https://images.unsplash.com/photo-1599420186946-7b6fb4e297f0?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80";
    profilePhotoUrl = json['profile_photo_url'];
    // membership = Membership.fromJson(json['membership']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['current_team_id'] = this.currentTeamId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['profile_photo_url'] = this.profilePhotoUrl;
    // if (this.membership != null) {
    //   data['membership'] = this.membership.toJson();
    // }
    return data;
  }
}

class Membership {
  late int teamId;
  late int userId;
  late String role;

  // Membership({this.teamId, this.userId, this.role});

  Membership.fromJson(Map<String, dynamic> json) {
    teamId = json['team_id'];
    userId = json['user_id'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['team_id'] = this.teamId;
    data['user_id'] = this.userId;
    data['role'] = this.role;
    return data;
  }
}

List<MemberModel> members = [
  // MemberModel(name: "Member 1", role: "developer"),
  // MemberModel(name: "Member 2", role: "owner"),
  // MemberModel(name: "Member 3", role: "tester"),
];
