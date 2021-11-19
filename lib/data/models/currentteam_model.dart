class Currentteam {
  int id = 0;
  String name = "";
  String email = "";
  var emailVerifiedAt;
  int currentTeamId = 0;
  var profilePhotoPath;

  String profilePhotoUrl = "";
  late Membership membership;

  Currentteam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    profilePhotoUrl = json['profile_photo_url'];
    /*membership = json['membership'] != null
        ? new Membership.fromJson(json['membership'])
        : null;*/
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
    /*if (this.membership != null) {
      data['membership'] = this.membership.toJson();
    }*/
    return data;
  }
}

class Membership {
  int teamId = 0;
  int userId = 0;
  String role ="";



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
