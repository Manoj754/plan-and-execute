import 'package:flutter/material.dart';
import 'package:plan_execute/constants/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plan_execute/data/providers/objective_notifier.dart';
import 'package:plan_execute/data/providers/providers.dart';

void openBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      elevation: 10,
      context: context,
      builder: (BuildContext context) {
        return SortBotttomSheet();
      });
}

class SortingValues {
  String title;
  int index;
  dynamic value;
  SortingValues(
      {required this.title, required this.index, required this.value});
}

class SortBotttomSheet extends StatefulWidget {
  SortBotttomSheet({Key? key}) : super(key: key);

  @override
  _SortBotttomSheetState createState() => _SortBotttomSheetState();
}

class _SortBotttomSheetState extends State<SortBotttomSheet> {
  int selectedStatus = 0;
  int selectedrange = 0;
  dynamic selectedStatusvalue;
  dynamic selectedrangevalue;
  List<SortingValues> byStatusList = [
    SortingValues(title: 'Completed', index: 0, value: 1),
    SortingValues(title: 'Not Started', index: 1, value: 0),
    SortingValues(title: 'In-progress', index: 2, value: 2),
    SortingValues(title: 'Missed', index: 3, value: 3),
  ];
  List<SortingValues> rangeList = [
    SortingValues(title: 'Due in this week', index: 0, value: "week"),
    SortingValues(title: 'Due in this month', index: 1, value: "month"),
    SortingValues(title: 'Due in this quarter', index: 2, value: "quarter"),
    SortingValues(title: 'Due in this year', index: 3, value: "year"),
  ];
  final double horPadding = 8;
  BorderRadius borderRadius = BorderRadius.circular(10);
  final horspace = 0.05;
  @override
  void initState() {
    selectedStatus = context.read(objectiveprovider).selectedStatus;
    selectedrange = context.read(objectiveprovider).selectedrange;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    EdgeInsetsGeometry padding =
        EdgeInsets.symmetric(horizontal: size.width * 0.04);
    return Card(
      elevation: 5,
      color: dialogBackgroundColor,
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horPadding,
          vertical: 8,
        ),
        child: Container(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('By Status'),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: padding,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          statusButtonWrapper(
                            byStatusList[0],
                          ),
                          SizedBox(
                            width: size.width * horspace,
                          ),
                          statusButtonWrapper(
                            byStatusList[1],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          statusButtonWrapper(
                            byStatusList[2],
                          ),
                          SizedBox(
                            width: size.width * horspace,
                          ),
                          statusButtonWrapper(
                            byStatusList[3],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('By Due Range'),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: padding,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          rangeButtonWrapper(
                            rangeList[0],
                          ),
                          SizedBox(
                            width: size.width * horspace,
                          ),
                          rangeButtonWrapper(
                            rangeList[1],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          rangeButtonWrapper(
                            rangeList[2],
                          ),
                          SizedBox(
                            width: size.width * horspace,
                          ),
                          rangeButtonWrapper(
                            rangeList[3],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    selectedStatusvalue = byStatusList[selectedStatus].value;
                    selectedrangevalue = rangeList[selectedrange].value;
                    print(" range" + selectedrangevalue.toString());
                    print("status " + selectedStatusvalue.toString());
                    context.read(objectiveprovider).load(
                        completed: selectedStatus.toString(),
                        due_range: selectedrange.toString());
                    context.read(objectiveprovider)
                      ..selectedrange = selectedrange
                      ..selectedStatus = selectedStatus;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: borderRadius),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: borderRadius,
                            color: Theme.of(context).primaryColor),
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        width: (size.width * 0.8 / 2) - horPadding * 2,
                        child: Center(
                            child: Text(
                          "Apply",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget statusButtonWrapper(
    SortingValues sortingValues,
  ) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(() {
          selectedStatus = sortingValues.index;
          // selectedStatusvalue = sortingValues.value;
        });
      },
      child: statusButon(selectedStatus, sortingValues, size),
    );
  }

  Widget rangeButtonWrapper(
    SortingValues sortingValues,
  ) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(() {
          selectedrange = sortingValues.index;
          // selectedrangevalue = sortingValues.value;
        });
      },
      child: statusButon(selectedrange, sortingValues, size),
    );
  }

  Widget statusButon(int index, SortingValues sortingValues, Size size) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: index == sortingValues.index
              ? Theme.of(context).primaryColor
              : Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        width: (size.width * 0.8 / 2) - horPadding * 2,
        child: Center(
            child: Text(
          sortingValues.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color:
                  index == sortingValues.index ? Colors.white : Colors.black),
        )),
      ),
    );
  }
}
