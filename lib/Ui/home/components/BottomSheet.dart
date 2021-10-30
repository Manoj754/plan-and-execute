import 'package:flutter/material.dart';
import 'package:plan_execute/constants/colors.dart';

void openBottomSheet(BuildContext context) {
  showModalBottomSheet(
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
  SortingValues({required this.title, required this.index});
}

class SortBotttomSheet extends StatefulWidget {
  SortBotttomSheet({Key? key}) : super(key: key);

  @override
  _SortBotttomSheetState createState() => _SortBotttomSheetState();
}

class _SortBotttomSheetState extends State<SortBotttomSheet> {
  int selectedStatus = 0;
  int selectedrange = 0;
  List<SortingValues> byStatusList = [
    SortingValues(title: 'Completed', index: 0),
    SortingValues(title: 'Not Started', index: 1),
    SortingValues(title: 'In-progress', index: 2),
    SortingValues(title: 'Missed', index: 3),
  ];
  List<SortingValues> rangeList = [
    SortingValues(title: 'Due in this week', index: 0),
    SortingValues(title: 'Due in this month', index: 1),
    SortingValues(title: 'Due in this quarter', index: 2),
    SortingValues(title: 'Due in this year', index: 3),
  ];
  final double horPadding = 8;
  BorderRadius borderRadius = BorderRadius.circular(10);
  final horspace = 0.05;
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
