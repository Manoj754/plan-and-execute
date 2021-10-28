import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/home/components/cutom_drawer.dart';
import 'dart:math' as math;

import 'package:plan_execute/constants/colors.dart';

double heightFactor = .05;

class TeamsExpantion extends StatefulWidget {
  TeamsExpantion({Key? key}) : super(key: key);

  @override
  _TeamsExpantionState createState() => _TeamsExpantionState();
}

class _TeamsExpantionState extends State<TeamsExpantion> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: teamBackgroundColor,
        elevation: 5,
        child: ExpansionTile(
          // backgroundColor: teamBackgroundColor,
          childrenPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 18),
          title: Row(
            children: [
              Text(
                "Teams",
                style: theme.textTheme.bodyText2!.copyWith(fontSize: 18),
              ),
              Expanded(child: Container()),
              Text(
                teams.length.toString(),
                style: theme.textTheme.headline1,
              ),
            ],
          ),
          children: [
            Divider(
              height: 0,
              color: Colors.white,
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: MediaQuery.of(context).size.width * .3,
                decoration: BoxDecoration(
                    color: teamBackgroundColorDark,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      "Owner",
                      style:
                          theme.textTheme.bodyText2!.copyWith(color: teamRed),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: math.min(5, teams.length) *
                  MediaQuery.of(context).size.height *
                  heightFactor,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: size.height * heightFactor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            color: Colors.black.withOpacity(.5),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            teams[index].name,
                            style: theme.textTheme.subtitle1!
                                .copyWith(fontSize: 16),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 8),
                                child: Text(
                                  teams[index].owner,
                                  style: theme.textTheme.headline6,
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                },
                itemCount: teams.length,
              ),
            ),
            Divider(
              height: 10,
              color: Colors.white,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
