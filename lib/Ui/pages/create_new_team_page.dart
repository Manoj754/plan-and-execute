import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/components/common_button.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';
import 'package:plan_execute/constants/colors.dart';

class CreateNewTeamPage extends StatefulWidget {
  @override
  CreateNewTeamPageState createState() => CreateNewTeamPageState();
}

class CreateNewTeamPageState extends State<CreateNewTeamPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Creat New Team",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                // CircleAvatar(
                //   radius: 30,
                //   backgroundColor: Colors.grey,
                //   backgroundImage: NetworkImage(
                //       "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png"),
                // ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Owner Name",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 20),
                    ),
                    Text(
                      "owner@gmail.com",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Divider(
            //   indent: 10,
            //   endIndent: 10,
            //   height: 0,
            //   color: Colors.grey,
            // ),
            SizedBox(
              height: 25,
            ),
            EditField(
              leading: Icons.group,
              hint: "Team Name",
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: primaryColor,
                ),
                child: Center(
                    child: Text(
                  "Creat Team",
                  style: TextStyle(color: Colors.white),
                ))),
            // CommonButton(label: ,)
          ],
        ),
      ),
    );
  }
}
