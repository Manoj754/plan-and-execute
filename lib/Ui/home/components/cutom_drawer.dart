import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:plan_execute/Ui/home/components/invite_member_bottom_sheet.dart';
import 'package:plan_execute/constants/colors.dart';
import 'package:plan_execute/data/models/team_model.dart';
import 'package:plan_execute/data/providers/providers.dart';
import 'package:plan_execute/routes/routes.dart';

final teams = [
  TeamModel(
      email: "test1@gmail.com",
      name: "Personal team",
      url:
          "https://images.unsplash.com/photo-1634923093368-c1022f628a34?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  TeamModel(
      email: "test2@gmail.com",
      name: "test team",
      url:
          "https://images.unsplash.com/photo-1634923093368-c1022f628a34?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  TeamModel(
      email: "test1@gmail.com",
      name: "nothing team",
      url:
          "https://images.unsplash.com/photo-1634923093368-c1022f628a34?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
];

class CustomDrawer extends StatefulHookWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final teamNotifier = useProvider(teamProvider);
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xfff3f3f4),
      body: SafeArea(
        child: Container(
          // color: Color(0xfff3f3f4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Switch Teams",
                  style: theme.headline1,
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return SingleTeamWidget(teamModel: teams[index]);
                    },
                    itemCount: teamNotifier.teamModel.length,
                  ),
                  // child: Column(
                  //   children: [
                  //     SingleTeamWidget(
                  //       teamModel: teams[0],
                  //     )
                  //   ],
                  // ),
                ),
                SingleOption(
                  icon: Icons.add,
                  label: "Create new team",
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.createNewTeamPage);
                  },
                ),
                SingleOption(
                  icon: Icons.help,
                  label: "Help",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SingleOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onTap;
  const SingleOption(
      {required this.label, required this.icon, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap as VoidCallback?,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: theme.subtitle1!.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleTeamWidget extends StatelessWidget {
  final TeamModel teamModel;
  const SingleTeamWidget({required this.teamModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      shadowColor: primaryColor,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(teamModel.url),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teamModel.name,
                      overflow: TextOverflow.ellipsis,
                      style: theme.headline2,
                    ),
                    Text(
                      teamModel.email,
                      overflow: TextOverflow.ellipsis,
                      style: theme.subtitle1,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  showInviteBottomShit(context, teamModel);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.more_vert),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
