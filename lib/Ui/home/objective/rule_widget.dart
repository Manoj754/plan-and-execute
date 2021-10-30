import 'package:flutter/material.dart';
import 'package:plan_execute/data/models/rule_model.dart';

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
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.edit_outlined),
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
}
