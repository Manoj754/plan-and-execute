import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/signIn_page.dart';

class ChatNotification extends StatefulWidget {
  @override
  _ChatNotificationState createState() => _ChatNotificationState();
}

class _ChatNotificationState extends State<ChatNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Notification",
              style: Theme.of(context).textTheme.headline1,
            ),
            // textTheme: Theme.of(context).textTheme,
            // titleTextStyle: Theme.of(context).textTheme.headline1,
          ),
          body: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  // visualDensity: VisualDensity(horizontal: -1, vertical: 0),
                  contentPadding: EdgeInsets.only(left: 10),
                  trailing: Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.amber),
                    child: Text(
                      "Objective",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/ikRHGbiXJL8o/v0/1000x-1.jpg"),
                  ),
                  title: Row(
                    children: [
                      Text(
                        "APIMan ",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "created",
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Herbert Guzman",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: Colors.grey,
                  height: 0,
                ),
                ListTile(
                  // visualDensity: VisualDensity(horizontal: -1, vertical: 0),
                  contentPadding: EdgeInsets.only(left: 10),
                  trailing: Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.amber),
                    child: Text(
                      "Objective",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVJDluM9eKiKqhZde3i_WH0bgI4dFuUqTfLNff1mJbfkhBODJ5QX72S8IiEzgdFaisnqk&usqp=CAU"),
                  ),
                  title: Row(
                    children: [
                      Text(
                        "APIMan ",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "updated",
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Jack Lee",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: Colors.grey,
                  height: 0,
                ),
                ListTile(
                  // visualDensity: VisualDensity(horizontal: -1, vertical: 0),
                  contentPadding: EdgeInsets.only(left: 10),
                  trailing: Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.amber),
                    child: Text(
                      "Objective",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        "https://pbs.twimg.com/profile_images/1075776648363028480/_IlPbvr0_400x400.jpg"),
                  ),
                  title: Row(
                    children: [
                      Text(
                        "APIMan ",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "updated",
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Herbert Guzman",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: Colors.grey,
                  height: 0,
                ),
                ListTile(
                  // visualDensity: VisualDensity(horizontal: -1, vertical: 0),
                  contentPadding: EdgeInsets.only(left: 10),
                  trailing: Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.teal),
                    child: Text(
                      "key result",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuWlKVGJeILLo6n3_-9GgvdvWyz7MJbC1o7g&usqp=CAU"),
                  ),
                  title: Row(
                    children: [
                      Text(
                        "APIMan ",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "updated",
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Herbert Guzman",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: Colors.grey,
                  height: 0,
                ),
                ListTile(
                  // visualDensity: VisualDensity(horizontal: -1, vertical: 0),
                  contentPadding: EdgeInsets.only(left: 10),
                  trailing: Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.teal),
                    child: Text(
                      "key result",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        "https://dunham-bush.com/wp-content/uploads/2019/02/person2.jpg"),
                  ),
                  title: Row(
                    children: [
                      Text(
                        "APIMan ",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "updated",
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Herbert Guzman",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: Colors.grey,
                  height: 0,
                ),
                ListTile(
                  // visualDensity: VisualDensity(horizontal: -1, vertical: 0),
                  contentPadding: EdgeInsets.only(left: 10),
                  trailing: Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.teal),
                    child: Text(
                      "key result",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu0BN8p9JoJwpMhj54ceks0LELsA0nm0ExDIZ0caVf2JjtxMrs5SWMOHoAd57h5rtJqA4&usqp=CAU"),
                  ),
                  title: Row(
                    children: [
                      Text(
                        "APIMan ",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "created",
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Herbert Guzman",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
