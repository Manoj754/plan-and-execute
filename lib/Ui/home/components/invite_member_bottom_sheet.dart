import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:plan_execute/constants/colors.dart';
import 'package:plan_execute/data/models/team_model.dart';
import 'package:plan_execute/data/providers/providers.dart';
import 'package:plan_execute/routes/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

showInviteBottomShit(BuildContext context, {TeamModel? teamModel}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 10,
      builder: (context) {
        return InviteMembetBottomShit(
            teamModel: context.read(teamProvider).currentTeam!);
      });
}

class InviteMembetBottomShit extends HookWidget {
  final TeamModel teamModel;
  const InviteMembetBottomShit({required this.teamModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final teamModel = useProvider(teamProvider).currentTeam;
    return Card(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(teamModel!.url),
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
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                // Navigator.pop(context);
                Navigator.pushNamed(context, PageRoutes.inviteMemberPage);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.person_add_alt_1_outlined),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Invite members",
                      style: theme.headline3,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.teamSetting,
                    arguments: teamModel);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings_outlined,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Team setting",
                      style: theme.headline3!,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showConfrimDialog(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Delete team",
                      style: theme.headline3!.copyWith(color: primaryColor),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showConfrimDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Are you sure?",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context, false);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("No"),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context, true);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Yes"),
                ),
              )
            ],
          );
        });
  }
}
