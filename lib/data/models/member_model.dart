class MemberModel {
  String name;
  String role;
  String profile;
  MemberModel(
      {this.name = "Not given",
      this.role = "owner",
      this.profile =
          "https://images.unsplash.com/photo-1635107054269-d8a3163d4ae2?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"});
}

List<MemberModel> members = [
  MemberModel(name: "Member 1", role: "developer"),
  MemberModel(name: "Member 2", role: "owner"),
  // MemberModel(name: "Member 3", role: "tester"),
];
