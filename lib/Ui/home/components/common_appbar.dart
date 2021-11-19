import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';
import 'package:plan_execute/Ui/home/components/BottomSheet.dart';
import 'package:plan_execute/Ui/home/home_screen.dart';
import 'package:plan_execute/data/providers/providers.dart';

import 'invite_member_bottom_sheet.dart';

final url =
    "https://images.unsplash.com/photo-1634921553571-376a18dde21a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";

class CommonAppBar extends StatefulHookWidget {
  int pageNumber;
  CommonAppBar({required this.pageNumber, Key? key}) : super(key: key);

  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  bool search = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = useProvider(teamProvider);
    print('page appBuild =' + widget.pageNumber.toString());
    final theme = Theme.of(context).textTheme;
    return Container(
      child: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    // Scaffold.of(context).openDrawer();
                    if (drawerController.isOpen) {
                      drawerController.openDrawer();
                    } else {
                      drawerController.closeDrawer();
                    }
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(url),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: search && widget.pageNumber == 1
                        ? Container(
                            child: SearchField(
                              controller: searchController,
                              hint: 'Search',
                            ),
                          )
                        : Text(provider.currentTeam?.name ?? "",
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: theme.headline1)),
                widget.pageNumber == 0
                    ? InkWell(
                        onTap: () {
                          showInviteBottomShit(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.more_vert),
                        ),
                      )
                    : widget.pageNumber == 1
                        ? Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      search = !search;
                                    });
                                  },
                                  icon: Icon(
                                      !search ? Icons.search : Icons.cancel)),
                              IconButton(
                                  onPressed: () {
                                    openBottomSheet(context);
                                  },
                                  icon: Icon(Icons.filter_alt_outlined))
                            ],
                          )
                        : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
