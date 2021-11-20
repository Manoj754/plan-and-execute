import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';
import 'package:plan_execute/Ui/components/common_button.dart';
import 'package:plan_execute/Ui/components/date_picker.dart';
import 'package:plan_execute/Ui/components/drop_down_button.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';
import 'package:plan_execute/Ui/home/objective/rule_widget.dart';
import 'package:plan_execute/Ui/signIn_page.dart';
import 'package:plan_execute/Ui/utils.dart';
import 'package:plan_execute/constants/colors.dart';
import 'package:plan_execute/data/models/member_model.dart';
import 'package:plan_execute/data/models/currentteam_model.dart';
import 'package:plan_execute/data/models/objectivemodel.dart';
import 'package:plan_execute/data/models/rule_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plan_execute/data/providers/apiEndes.dart';
import 'package:plan_execute/data/providers/objective_notifier.dart';
import 'package:plan_execute/data/providers/providers.dart';

class CreateObjective extends StatefulHookWidget {
  final bool isEdit;

  CreateObjective({this.isEdit = false, Key? key}) : super(key: key);

  @override
  _CreateObjectiveState createState() => _CreateObjectiveState();
}

class _CreateObjectiveState extends State<CreateObjective>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  ObjectiveModel? objectivemodel;
  bool isObjectCreated = false;
  int totalKeyRules = 0;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    if (widget.isEdit) {
      isObjectCreated = true;
    }
    controller.addListener(() {
      if (controller.index == 1 && !isObjectCreated) {
        controller.index = 0;
        showToast("First Create Objective");
      }
    });

    // controller.addListener(() {
    //   setState(() {});
    // });

    super.initState();
  }

  String get keyRuleCount {
    if (!widget.isEdit) return "0";
    return objectivemodel?.otherKeyResults.length.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isEdit)
      objectivemodel = useProvider(objectiveprovider).currentObejctive;
    /*context
        .read(objectiveprovider)
        .viewobjective(objectivemodel!.id.toString());*/
    return Container(
      decoration: backGroundDecoration,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.isEdit ? "Edit Objective" : "Create Objective",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
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
                          Text("Key Result"),
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
                                keyRuleCount,
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
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [
                      PrimaryDetails(
                        isEdit: widget.isEdit,
                        onObjectCreated: () {
                          isObjectCreated = true;
                          setState(() {});
                        },
                      ),
                      KeyRulesScreen(
                        isEdit: widget.isEdit,
                      )
                    ]),
              ),
              // CommonButton(
              //   label: "Save",
              //   isExpanded: true,
              //   radius: 0,
              //   onTap: () {
              //     // context.read(objectiveprovider).createobjective("2", co, duedate, description)
              //     Navigator.maybePop(context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CustomTabWidget extends StatefulWidget {
//   final int index;
//   final String label;
//   final Widget child;
//   final Widget? unselectedChild;
//   final TabController controller;
//   final bool isEdit;
//   CustomTabWidget(
//       {required this.index,
//       required this.label,
//       required this.child,
//       this.unselectedChild,
//       this.isEdit = false,
//       required this.controller,
//       Key? key})
//       : super(key: key);

//   @override
//   _CustomTabWidgetState createState() => _CustomTabWidgetState();
// }

// class _CustomTabWidgetState extends State<CustomTabWidget> {
//   @override
//   void initState() {
//     widget.controller.addListener(() {
//       setState(() {});
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class PrimaryDetails extends StatefulHookWidget {
  final bool isEdit;
  final Function? onObjectCreated;

  PrimaryDetails({this.isEdit = false, this.onObjectCreated, Key? key})
      : super(key: key);

  @override
  _PrimaryDetailsState createState() => _PrimaryDetailsState();
}

class _PrimaryDetailsState extends State<PrimaryDetails> {
  List<MemberModel> members = [];
  dynamic currentObjectType = 1;
  dynamic currentAssignedMembder = 1;
  List<int> listOFSelectedItem = [];
  String selectedText = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  ObjectiveModel? objectivemodel;
  DateTime? dueDate;
  @override
  void initState() {
    if (widget.isEdit) {
      namecontroller.text = "Task 1";
      descriptioncontroller.text = "Do it fast";
      currentObjectType = 2;
    }
    members = context.read(teamProvider).currentMembers;
    if (members.length > 0) {
      currentAssignedMembder = members.first.id;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _objectiveNotifier = useProvider(objectiveprovider);
    final provider = useProvider(objectiveprovider);
    if (widget.isEdit) {
      /* */
      objectivemodel = provider.currentObejctive;
      // provider.viewobjective(objectivemodel!.id.toString());
      /* context
          .read(objectiveprovider)
          .viewobjective(objectivemodel!.id.toString());*/
      namecontroller.text = objectivemodel!.name;
      descriptioncontroller.text = objectivemodel!.description;
      currentObjectType = 2;
    }
    final theme = Theme.of(context).textTheme;
    final lableStyle = theme.subtitle2!.copyWith(fontSize: 16);
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
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
                    height: 5,
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
                    "User",
                    style: lableStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  currentObjectType == 2
                      ? CustomDropDownButton(
                          currentValue: currentAssignedMembder,
                          items: members
                              .map((e) => DropdownMenuItem(
                                    child: Text(e.name),
                                    value: e.id,
                                  ))
                              .toList(),
                          // items: [
                          //   DropdownMenuItem(
                          //     child: Text("Admin"),
                          //     value: 1,
                          //   ),
                          //   DropdownMenuItem(
                          //     child: Text("developer"),
                          //     value: 2,
                          //   ),
                          // ],

                          radius: 10,
                          onChanged: (v) {
                            currentAssignedMembder = v;
                            listOFSelectedItem = [currentAssignedMembder];

                            setState(() {});
                          },
                        )
                      : Container(
                          // margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: ExpansionTile(
                            title: Text(
                              listOFSelectedItem.isEmpty
                                  ? "Select"
                                  : listOFSelectedItem.map((e) {
                                      return members
                                          .firstWhere(
                                              (element) => element.id == e)
                                          .name;
                                    }).join(', '),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0,
                              ),
                            ),
                            children: <Widget>[
                              new ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: members.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 8.0),
                                    child: _ViewItem(
                                        item: members[index],
                                        selected: (val) {
                                          selectedText = val.toString();
                                          if (listOFSelectedItem
                                              .contains(val)) {
                                            listOFSelectedItem.remove(val);
                                          } else {
                                            listOFSelectedItem.add(val);
                                          }
                                          // widget.selectedList(listOFSelectedItem);
                                          setState(() {});
                                        },
                                        itemSelected: listOFSelectedItem
                                            .contains(_objectiveNotifier
                                                .currentteammodel[index].id)),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Name",
                    style: lableStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  EditField(
                    hint: "Name",
                    radius: 10,
                    controller: namecontroller,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Description",
                    style: lableStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  EditField(
                    hint: "Description",
                    radius: 10,
                    controller: descriptioncontroller,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Due Date",
                    style: lableStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomDatePicker(
                    radius: 10,
                    date: widget.isEdit
                        ? formter(objectivemodel!.dueDate)
                        : DateTime.now(),
                    onDateChange: (d) {
                      dueDate = d;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // CommonButton(
                  //   label: "Save",
                  //   isExpanded: true,
                  //   radius: 0,
                  //   onTap: () {
                  //     // context.read(objectiveprovider).createobjective("2", co, duedate, description)
                  //     Navigator.maybePop(context);
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
        CommonButton(
          label: "Save",
          isExpanded: true,
          radius: 0,
          onTap: () {
            if (listOFSelectedItem.isEmpty) {
              showToast("Select User");
              return;
            }
            if (namecontroller.text.length == 0) {
              showToast("Please Enter Name");
              return;
            }
            final res = context.read(objectiveprovider).createobjective(
                namecontroller.text,
                dueDate.toString(),
                descriptioncontroller.text,
                listOFSelectedItem);
            if (widget.onObjectCreated != null) {
              widget.onObjectCreated!();
            }
            // Navigator.maybePop(context);
          },
        ),
      ],
    );
  }

  DateTime formter(String dueDate) {
    final DateFormat format = new DateFormat("yyyy-MM-dd");
    return format.parse(dueDate);
  }
}

class _ViewItem extends StatelessWidget {
  MemberModel item;
  bool itemSelected;
  final Function(int) selected;

  _ViewItem(
      {required this.item, required this.itemSelected, required this.selected});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * .032, right: size.width * .098),
      child: Row(
        children: [
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: Checkbox(
              value: itemSelected,
              onChanged: (val) {
                selected(item.id);
              },
              activeColor: primaryColor,
            ),
          ),
          SizedBox(
            width: size.width * .025,
          ),
          Text(
            item.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 17.0,
            ),
          ),
        ],
      ),
    );
  }
}

class KeyRulesScreen extends StatefulHookWidget {
  final bool isEdit;

  const KeyRulesScreen({this.isEdit = false, Key? key}) : super(key: key);

  @override
  _KeyRulesScreenState createState() => _KeyRulesScreenState();
}

class _KeyRulesScreenState extends State<KeyRulesScreen> {
  ObjectiveModel? objectiveModel;

  @override
  Widget build(BuildContext context) {
    if (widget.isEdit) {
      objectiveModel = useProvider(objectiveprovider).currentObejctive;
      /*context
          .read(objectiveprovider)
          .viewobjective(objectiveModel!.id.toString());*/
    }
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
            onTap: () {
              showAddRuleDialog("", "add");
            },
          ),
          const SizedBox(
            height: 20,
          ),
          objectiveModel != null
              ? ListView(
                  shrinkWrap: true,
                  children: [
                    ...objectiveModel!.otherKeyResults
                        .map((e) => SingleRuleWidget(rule: e))
                        .toList()
                  ],
                )
              : Container(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  showAddRuleDialog(String text, String type) async {
    final res = await showDialog(
        context: context,
        builder: (context) {
          return RuleWidget(text, type);
        });
    print(res);
  }
}

class RuleWidget extends StatefulHookWidget {
  String text;
  String type;

  RuleWidget(this.text, this.type, {Key? key}) : super(key: key);

  @override
  _RuleWidgetState createState() => _RuleWidgetState();
}

class _RuleWidgetState extends State<RuleWidget> {
  TextEditingController ruleController = TextEditingController();
  DateTime? dueDate;
  OtherKeyResults? keyResults;
  ObjectiveModel? objectiveModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text != "") {
      ruleController.text = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    keyResults = context.read(objectiveprovider).currentkeyresult;
    objectiveModel = context.read(objectiveprovider).currentObejctive;
    final provider = useProvider(objectiveprovider);
    final theme = Theme.of(context).textTheme;
    final lableStyle = theme.subtitle2!.copyWith(fontSize: 16);

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Key Rules",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),

            Divider(
              color: Colors.grey,
            ),
            // Text(
            //   "Enter Rule",
            //   style: lableStyle,
            // ),
            const SizedBox(
              height: 10,
            ),
            EditField(
              controller: ruleController,
              hint: "Enter Name",
              radius: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            // Text(
            //   "Due Date",
            //   style: lableStyle,
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            /* CustomDatePicker(
              radius: 10,
              onDateChange: (d) {
                dueDate = d;
              },
            ),
            const SizedBox(
              height: 10,
            ),*/
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: InkWell(
            //     onTap: () {
            //       if (ruleController.text == "") {
            //         showToast("Enter Rule");
            //       } else {
            //         print(dueDate.toString());
            //       }
            //       RuleModel rule =
            //           RuleModel(name: ruleController.text, date: dueDate);
            //       Navigator.pop(context, rule);

            //       // Navigator.pop(context);
            //     },
            //     child: Padding(
            //       padding: const EdgeInsets.all(12.0),
            //       child: Text("Add"),
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                if (widget.type == "add") {
                  print(objectiveModel.toString());
                  /*context
                      .read(objectiveprovider)
                      .keyaddrule(objectiveModel!.id.toString(), ruleController.text);*/
                  provider.keyaddrule(
                      objectiveModel!.id.toString(), ruleController.text);
                } else {
                  print(keyResults.toString());
                  /*context
                      .read(objectiveprovider)
                      .updatekeyrule(keyResults!.id.toString(), "1", ruleController.text);
*/
                  provider.updatekeyrule(
                      keyResults!.id.toString(), "1", ruleController.text);
                }
                provider.viewobjective(objectiveModel!.id.toString());
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: Center(
                    child: Text(
                  "ADD RULES",
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
