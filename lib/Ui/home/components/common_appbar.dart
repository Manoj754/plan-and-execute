import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';
import 'package:plan_execute/Ui/home/components/BottomSheet.dart';
import 'package:plan_execute/Ui/home/home_screen.dart';

final url =
    "https://images.unsplash.com/photo-1634921553571-376a18dde21a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";

class CommonAppBar extends StatefulWidget {
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
    print('page appBuild =' + widget.pageNumber.toString());
    final theme = Theme.of(context).textTheme;
    return Container(
      child: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                        : Text("API Main's Personal team",
                            overflow: TextOverflow.clip,
                            style: theme.headline1)),
                widget.pageNumber == 1
                    ? Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  search = !search;
                                });
                              },
                              icon:
                                  Icon(!search ? Icons.search : Icons.cancel)),
                          IconButton(
                              onPressed: () {
                                openBottomSheet(context);
                              },
                              icon: Icon(Icons.filter_alt))
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
