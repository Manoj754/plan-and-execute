import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/home/components/member_expansion.dart';
import 'package:plan_execute/Ui/home/components/objective_expension.dart';
import 'package:plan_execute/Ui/home/components/team_expansion.dart';
import 'package:plan_execute/Ui/home/home_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 0),
                  itemBuilder: (context, index) {
                    return SingleChart(
                      chartModel: chartList[index],
                    );
                  },
                  itemCount: chartList.length,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8),
          //   child: Card(
          //     color: teamBackgroundColor,
          //     elevation: 5,
          //     child: ExpansionTile(
          //       // backgroundColor: teamBackgroundColor,
          //       childrenPadding:
          //           EdgeInsets.symmetric(vertical: 4, horizontal: 18),
          //       title: Row(
          //         children: [
          //           Text(
          //             "Team",
          //             style: theme.textTheme.bodyText2!.copyWith(fontSize: 18),
          //           ),
          //           Expanded(child: Container()),
          //           Text(
          //             "5",
          //             style: theme.textTheme.headline1,
          //           ),
          //         ],
          //       ),
          //       children: [
          //         Divider(
          //           height: 0,
          //           color: Colors.white,
          //           thickness: 1,
          //         ),
          //         Row(
          //           children: [Icon(Icons.person)],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          TeamsExpantion(),
          MemberExpansion(),
          ObjectivesExpansion(),
          // CustomExpanded(),
          // Expanded(child: Container()),
        ],
      ),
    );
  }
}
