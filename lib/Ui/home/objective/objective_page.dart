import 'package:flutter/material.dart';
import 'package:plan_execute/constants/colors.dart';
import 'package:plan_execute/data/models/objective_model.dart';

class ObjectivePage extends StatefulWidget {
  const ObjectivePage({Key? key}) : super(key: key);

  @override
  _ObjectivePageState createState() => _ObjectivePageState();
}

class _ObjectivePageState extends State<ObjectivePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SingleObjectiveWidget(objective: objectives[0]);
              },
              itemCount: 5,
            ),
            // SingleSrollableWidget(),
          ],
        ),
      ),
    );
  }
}

class SingleObjectiveWidget extends StatefulWidget {
  final ObjectiveModel objective;
  SingleObjectiveWidget({required this.objective, Key? key}) : super(key: key);

  @override
  _SingleObjectiveWidgetState createState() => _SingleObjectiveWidgetState();
}

class _SingleObjectiveWidgetState extends State<SingleObjectiveWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          child: Row(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle, color: Colors.grey.withOpacity(.5)),
              //   child: Padding(
              //     padding: const EdgeInsets.all(2.0),
              //     child: CircleAvatar(
              //       backgroundImage: NetworkImage(objectives[0].profile),
              //       radius: 30,
              //     ),
              //   ),
              // ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.withOpacity(.5), width: 1.5),
                    borderRadius: BorderRadius.circular(6)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    objectives[0].profile,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.objective.member, style: theme.bodyText2),
                    Text(widget.objective.name,
                        style: theme.subtitle1!.copyWith(fontSize: 16)),
                    Text(
                      widget.objective.expires,
                      style: theme.subtitle2,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: objectiveBackGroundColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${widget.objective.completedTask}/${widget.objective.totalResult}',
                        style: theme.headline3!.copyWith(fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "3 days",
                    style: theme.subtitle2!.copyWith(fontSize: 10),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SingleSrollableWidget extends StatefulWidget {
  SingleSrollableWidget({Key? key}) : super(key: key);

  @override
  _SingleSrollableWidgetState createState() => _SingleSrollableWidgetState();
}

class _SingleSrollableWidgetState extends State<SingleSrollableWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          color: Colors.amber,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.teal,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
