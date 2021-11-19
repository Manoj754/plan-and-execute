import 'package:flutter/material.dart';
import 'package:plan_execute/constants/colors.dart';
import 'package:plan_execute/data/models/member_model.dart';

import 'dart:math' as math;

double heightFactor = .07;

class MemberExpansion extends StatefulWidget {
  MemberExpansion({Key? key}) : super(key: key);

  @override
  _MemberExpansionState createState() => _MemberExpansionState();
}

class _MemberExpansionState extends State<MemberExpansion> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: memberBackGroundColor,
        elevation: 5,
        child: ExpansionTile(
          // backgroundColor: teamBackgroundColor,
          childrenPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 18),
          title: Row(
            children: [
              Text(
                "Member",
                style: theme.textTheme.bodyText2!.copyWith(fontSize: 18),
              ),
              Expanded(child: Container()),
              Text(
                members.length.toString(),
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('In'),
                  const SizedBox(
                    width: 2,
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width * .3,
                    decoration: BoxDecoration(
                        color: teamBackgroundColorDark,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        child: Text(
                          "Test 1",
                          style: theme.textTheme.bodyText2!
                              .copyWith(color: teamRed),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: math.min(5, members.length) *
                  (MediaQuery.of(context).size.height * heightFactor + 4),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: size.height * heightFactor,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Container(
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // height: size.height * heightFactor * .9,
                                  // width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: CircleAvatar(
                                      radius: size.height * heightFactor * .6,
                                      backgroundImage: NetworkImage(
                                          members[index].profilePhotoUrl),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  members[index].name,
                                  style: theme.textTheme.subtitle1!
                                      .copyWith(fontSize: 16),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 8),
                                      child: Text("",
                                          // members[index].membership.role,
                                          style: theme.textTheme.headline3!),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: members.length,
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
