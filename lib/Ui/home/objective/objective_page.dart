import 'package:flutter/material.dart';
import 'package:plan_execute/constants/colors.dart';
import 'package:plan_execute/data/models/objective_model.dart';
import 'package:plan_execute/routes/routes.dart';

class ObjectivePage extends StatefulWidget {
  const ObjectivePage({Key? key}) : super(key: key);

  @override
  _ObjectivePageState createState() => _ObjectivePageState();
}

class _ObjectivePageState extends State<ObjectivePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Align(
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.black.withOpacity(.5), width: .5),
                  borderRadius: BorderRadius.circular(100)),
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, PageRoutes.addObjective);
              },
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
            alignment: Alignment.bottomRight,
          ),
        )
      ],
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
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      elevation: 5,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              height: 60,
              child: Padding(
                padding: EdgeInsets.only(left: 8, right: 20),
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
                          Text(widget.objective.member,
                              style: textTheme.bodyText2),
                          Text(widget.objective.name,
                              style:
                                  textTheme.subtitle1!.copyWith(fontSize: 16)),
                          Text(
                            widget.objective.expires,
                            style: textTheme.subtitle2,
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
                              style:
                                  textTheme.headline3!.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "3 days",
                          style: textTheme.subtitle2!.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 76,
              width: isOpen ? size.width - 90 : 30,
              decoration: BoxDecoration(
                // color: Color(0xFF8150E9),
                color: primaryColor.withAlpha(220),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isOpen = !isOpen;
                          });
                        },
                        onHorizontalDragEnd: (v) {
                          setState(() {
                            isOpen = !isOpen;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            !isOpen
                                ? Icons.arrow_back_ios
                                : Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  if (isOpen)
                    Flexible(
                        child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.textsms_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, PageRoutes.chatScreen);
                              },
                            ),
                            Flexible(
                                child: Text(
                              'Chat',
                              style: TextStyle(color: Colors.white),
                            ))
                          ],
                        )),
                        Expanded(
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.addObjective);
                                },
                              ),
                              Flexible(
                                child: InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Show',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, PageRoutes.addObjective,
                                    arguments: true);
                              },
                            ),
                            Flexible(
                              child: Text(
                                'Edit',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.delete_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            Flexible(
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        )),
                      ],
                    ))
                  else
                    Container(),
                ],
              ),
            ),
          )
        ],
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
