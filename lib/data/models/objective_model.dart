class ObjectiveModel {
  String name;
  String profile;
  String expires;
  bool inProgress;
  String member;
  int totalResult;
  int completedTask;
  ObjectiveModel({
    this.name = "name",
    this.expires = "02-03-2022",
    this.member = "Zain malik",
    this.profile =
        "https://images.unsplash.com/photo-1634993841974-e37dd3794593?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    this.inProgress = false,
    this.totalResult = 3,
    this.completedTask = 1,
  });
}

final objectives = <ObjectiveModel>[
  ObjectiveModel(inProgress: true),
  ObjectiveModel(totalResult: 4, completedTask: 2),
  ObjectiveModel(totalResult: 2, completedTask: 1),
  ObjectiveModel(inProgress: true),
];
