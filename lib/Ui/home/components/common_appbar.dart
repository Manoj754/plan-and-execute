import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/home/home_screen.dart';

final url =
    "https://images.unsplash.com/photo-1634921553571-376a18dde21a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Text("API Main's Personal team", style: theme.headline1)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
