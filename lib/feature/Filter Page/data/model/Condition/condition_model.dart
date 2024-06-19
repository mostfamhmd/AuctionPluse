class Condition {
  String condition;
  bool isSelected;

  Condition({required this.condition, this.isSelected = false});
}

List<Condition> conditions = [
  Condition(condition: "New"),
  Condition(condition: "Used"),
  Condition(condition: "Not Specified"),
];
