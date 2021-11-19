import 'package:flutter/material.dart';
import 'package:plan_execute/data/models/rule_model.dart';

import 'create_objective.dart';

class SingleRuleWidget extends StatelessWidget {
  final RuleModel rule;
  const SingleRuleWidget({Key? key, required this.rule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      elevation: 5,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  rule.name,
                  style: theme.bodyText2,
                ),
              ),
              InkWell(
                onTap: () {
                  showAddRuleDialog(rule.name, "update", context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(Icons.edit_outlined),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.delete_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAddRuleDialog(String text, String type, BuildContext context) async {
    final res = await showDialog(
        context: context,
        builder: (context) {
          return RuleWidget(text, type);
        });
    print(res);
  }
}
