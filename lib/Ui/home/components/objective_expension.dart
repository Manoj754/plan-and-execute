import 'package:flutter/material.dart';
import 'package:plan_execute/constants/colors.dart';
import 'package:plan_execute/data/models/objective_model.dart';

double heightFactor = .05;

class ObjectivesExpansion extends StatefulWidget {
  ObjectivesExpansion({Key? key}) : super(key: key);

  @override
  _ObjectivesExpansionState createState() => _ObjectivesExpansionState();
}

class _ObjectivesExpansionState extends State<ObjectivesExpansion> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: objectiveBackGroundColor,
        elevation: 5,
        child: ExpansionTile(
          // backgroundColor: teamBackgroundColor,
          childrenPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 18),
          title: Row(
            children: [
              Text(
                "Objective",
                style: theme.textTheme.bodyText2!.copyWith(fontSize: 18),
              ),
              Expanded(child: Container()),
              Text(
                objectives.length.toString(),
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
            ObjectiveList(),
            const SizedBox(
              height: 4,
            ),
            Align(
              child: Text(
                "In Progress noted with **",
                style: theme.textTheme.subtitle1?.copyWith(fontSize: 12),
              ),
              alignment: Alignment.centerLeft,
            ),
            const SizedBox(
              height: 10,
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

class ObjectiveList extends StatefulWidget {
  ObjectiveList({Key? key}) : super(key: key);

  @override
  _ObjectiveListState createState() => _ObjectiveListState();
}

class _ObjectiveListState extends State<ObjectiveList> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   children: [
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     SizedBox(width: size.width * .2, child: Text("User")),
            //     SizedBox(width: size.width * .3, child: Text("Name")),
            //     SizedBox(child: Text("Due Date")),
            //   ],
            // ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "User",
                    style: theme.textTheme.subtitle1,
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    "Name",
                    maxLines: 1,
                    style: theme.textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Due Date",
                          maxLines: 1,
                          style: theme.textTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  flex: 3,
                )
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              constraints: BoxConstraints(
                  maxHeight:
                      MediaQuery.of(context).size.height * heightFactor * 5),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SingleObjectiveWidget(
                    model: objectives[index],
                  );
                },
                itemCount: objectives.length,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class SingleObjectiveWidget extends StatelessWidget {
  final ObjectiveModel model;
  const SingleObjectiveWidget({required this.model, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(model.profile),
                  radius: size.height * heightFactor * .6,
                ),
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: Text(
              model.name,
              style: theme.textTheme.subtitle1!.copyWith(fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            flex: 3,
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: objectiveBackGroundColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Text(
                      model.expires,
                      style: theme.textTheme.headline6,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                if (model.inProgress)
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      "**",
                      style: theme.textTheme.subtitle1?.copyWith(fontSize: 12),
                    ),
                  ),
              ],
            ),
            flex: 3,
          )
        ],
      ),
    );
  }
}
