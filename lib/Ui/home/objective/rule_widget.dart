import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:plan_execute/data/models/objectivemodel.dart';
import 'package:plan_execute/data/models/rule_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plan_execute/data/providers/providers.dart';
import 'create_objective.dart';

class SingleRuleWidget extends StatefulHookWidget {
  final OtherKeyResults rule;

  const SingleRuleWidget({Key? key, required this.rule}) : super(key: key);
  @override
  _SingleRuleWidgetState createState() => _SingleRuleWidgetState();
}
class _SingleRuleWidgetState extends State<SingleRuleWidget>{
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final provider = useProvider(objectiveprovider);
    return Card(
      elevation: 5,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.rule.content,
                  style: theme.bodyText2,
                ),
              ),
              InkWell(
                onTap: () {
                  context.read(objectiveprovider).setCurrentkeyresult(widget.rule);
                  showAddRuleDialog(widget.rule.content, "update", context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(Icons.edit_outlined),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: (){
                  // context.read(objectiveprovider).deletekeyresult(widget.rule.id.toString());
                  provider.deletekeyresult(widget.rule.id.toString());
                  },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.delete_outlined,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


  showAddRuleDialog(String text, String type, BuildContext context) async {
    final res = await showDialog(
        context: context,
        builder: (context) {
          return RuleWidget(text, type);
        });
    print(res);
  }

