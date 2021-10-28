import 'package:flutter/material.dart';
import 'package:plan_execute/routes/routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(PageRoutes.editProfile);
            },
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: size.height * 0.1,
                      width: size.width * 0.23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png"),
                          ),
                          color: Colors.grey[300]),
                    ),
                    Positioned(
                      right: 1,
                      bottom: 0,
                      child: Container(
                        height: 13,
                        width: 13,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle,
                            color: Colors.green),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Manoj.kargar005",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Active"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.notifications_off_outlined,
                ),
                SizedBox(
                  width: size.width * 0.035,
                ),
                Text(
                  "Notification",
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: size.height * 0.025,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.sms_outlined,
                ),
                SizedBox(
                  width: size.width * 0.035,
                ),
                Text(
                  "Chat Notification",
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          // SizedBox(
          //   height: size.height * 0.015,
          // ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.changePassword);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.change_circle_outlined),
                  SizedBox(
                    width: size.width * 0.035,
                  ),
                  Text(
                    "Change Password",
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: size.height * 0.025,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.lock_outlined,
                ),
                SizedBox(
                  width: size.width * 0.035,
                ),
                Text(
                  "Privacy-Police",
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: size.height * 0.025,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.file_copy_outlined,
                ),
                SizedBox(
                  width: size.width * 0.035,
                ),
                Text(
                  "Team-Condition",
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.popAndPushNamed(context, PageRoutes.signInRoute);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                  ),
                  SizedBox(
                    width: size.width * 0.035,
                  ),
                  Text(
                    "Logout",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
