class RuleModel {
  String name;
  DateTime? date;
  RuleModel({required this.name, this.date});
}

final List<RuleModel> rules = [
  RuleModel(name: "must complete"),
  RuleModel(name: "do this"),
  RuleModel(name: "manage it")
];
