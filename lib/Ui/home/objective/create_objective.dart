import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plan_execute/Ui/components/common_button.dart';
import 'package:plan_execute/Ui/components/date_picker.dart';
import 'package:plan_execute/Ui/components/drop_down_button.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';
import 'package:plan_execute/Ui/home/objective/rule_widget.dart';
import 'package:plan_execute/Ui/utils.dart';
import 'package:plan_execute/constants/colors.dart';
import 'package:plan_execute/data/models/rule_model.dart';

class CreateObjective extends StatefulWidget {
  CreateObjective({Key? key}) : super(key: key);

  @override
  _CreateObjectiveState createState() => _CreateObjectiveState();
}

class _CreateObjectiveState extends State<CreateObjective>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    // controller.addListener(() {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              child: TabBar(
                controller: controller,
                tabs: [
                  Tab(
                    text: "Primary",
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("key"),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "3",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // text: "Key Rule ${controller.index.toString()}",
                  ),
                ],
                onTap: (int) {
                  print(int);
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                  controller: controller,
                  children: [PrimaryDetails(), KeyRulesScreen()]),
            ),
            CommonButton(
              label: "Save",
              isExpanded: true,
              radius: 0,
              onTap: () {
                Navigator.maybePop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabWidget extends StatefulWidget {
  final int index;
  final String label;
  final Widget child;
  final Widget? unselectedChild;
  final TabController controller;
  CustomTabWidget(
      {required this.index,
      required this.label,
      required this.child,
      this.unselectedChild,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  _CustomTabWidgetState createState() => _CustomTabWidgetState();
}

class _CustomTabWidgetState extends State<CustomTabWidget> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PrimaryDetails extends StatefulWidget {
  PrimaryDetails({Key? key}) : super(key: key);

  @override
  _PrimaryDetailsState createState() => _PrimaryDetailsState();
}

class _PrimaryDetailsState extends State<PrimaryDetails> {
  dynamic currentObjectType = 1;
  dynamic currentAssignedMembder = 1;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final lableStyle = theme.subtitle2!.copyWith(fontSize: 16);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Objective type",
            style: lableStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropDownButton(
            currentValue: currentObjectType,
            items: [
              DropdownMenuItem(
                child: Text("Team"),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("Individual"),
                value: 2,
              ),
            ],
            radius: 10,
            onChanged: (v) {
              currentObjectType = v;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Objective type",
            style: lableStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropDownButton(
            currentValue: currentAssignedMembder,
            items: [
              DropdownMenuItem(
                child: Text("Admin"),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("developer"),
                value: 2,
              ),
            ],
            radius: 10,
            onChanged: (v) {
              currentAssignedMembder = v;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Name",
            style: lableStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          EditField(
            hint: "Name",
            radius: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Description",
            style: lableStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          EditField(
            hint: "Description",
            radius: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Due Date",
            style: lableStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDatePicker(
            radius: 10,
          )
        ],
      ),
    );
  }
}

class KeyRulesScreen extends StatefulWidget {
  const KeyRulesScreen({Key? key}) : super(key: key);

  @override
  _KeyRulesScreenState createState() => _KeyRulesScreenState();
}

class _KeyRulesScreenState extends State<KeyRulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CommonButton(
            isExpanded: true,
            radius: 10,
            label: "ADD RULE",
            onTap: showAddRuleDialog,
          ),
          const SizedBox(
            height: 20,
          ),
          ListView(
            shrinkWrap: true,
            children: [...rules.map((e) => SingleRuleWidget(rule: e)).toList()],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  showAddRuleDialog() async {
    final res = await showDialog(
        context: context,
        builder: (context) {
          return RuleWidget();
        });
    print(res);
  }
}

class RuleWidget extends StatefulWidget {
  RuleWidget({Key? key}) : super(key: key);

  @override
  _RuleWidgetState createState() => _RuleWidgetState();
}

class _RuleWidgetState extends State<RuleWidget> {
  TextEditingController ruleController = TextEditingController();
  DateTime? dueDate;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final lableStyle = theme.subtitle2!.copyWith(fontSize: 16);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Enter Rule",
              style: lableStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            EditField(
              controller: ruleController,
              hint: "name",
              radius: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Due Date",
              style: lableStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomDatePicker(
              radius: 10,
              onDateChange: (d) {
                dueDate = d;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  if (ruleController.text == "") {
                    showToast("Enter Rule");
                  } else {
                    print(dueDate.toString());
                  }
                  RuleModel rule =
                      RuleModel(name: ruleController.text, date: dueDate);
                  Navigator.pop(context, rule);

                  // Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Add"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}