import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';

class InviteMemberPage extends StatefulWidget {
  @override
  InviteMemberPageState createState() => InviteMemberPageState();
}

class InviteMemberPageState extends State<InviteMemberPage> {
  int _value = -1;
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Invite Team Member",
                style: theme.bodyText2,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Team",
                style: theme.bodyText1!.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Text(
                  "Send",
                  style: theme.headline2!.copyWith(fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.send,
                  size: 25,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
        // backgroundColor: Colors.grey[500],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Join Our Team",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 15,
              ),
              EditField(
                leading: Icons.email,
                hint: "Add an Email Address",
              ),
              SizedBox(
                height: 25,
              ),
              Container(

                  // height: 165,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 3, spreadRadius: 2)
                      ],
                      color: Colors.white),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: type.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                                onTap: () {
                                  setState(() {
                                    currentindex = index;
                                  });
                                },
                                title: Text(
                                  "${type[index]}",
                                  style: (currentindex == index)
                                      ? theme.bodyText2!.copyWith(
                                          fontSize: 18,
                                        )
                                      : theme.subtitle1!.copyWith(fontSize: 18),
                                ),
                                trailing: Icon(
                                  Icons.verified_outlined,
                                  color: (currentindex == index)
                                      ? Colors.green
                                      : Colors.grey[300],
                                  size: 35,
                                )),
                            Divider(
                              indent: 10,
                              endIndent: 10,
                              height: 0,
                              color: Colors.grey,
                            ),
                          ],
                        );
                      })),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Pending Invitation",
                style: Theme.of(context).textTheme.headline1,
              ),
              Column(
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * .4),
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              spreadRadius: 2)
                        ],
                        color: Colors.white),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: Emails.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(Emails[index].emails,
                                  style: theme.headline3),
                              trailing: InkWell(
                                onTap: () {
                                  setState(() {
                                    Emails.removeAt(index);
                                  });
                                },
                                child: Icon(
                                  Icons.highlight_off,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            ),
                            Divider(
                              indent: 10,
                              endIndent: 10,
                              height: 0,
                              color: Colors.grey,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class email {
  String emails;

  email({required this.emails});
}

List<email> Emails = [
  email(emails: "test1@gmail.com"),
  email(emails: "test2@gmail.com"),
  email(emails: "test3@gmail.com"),
  email(emails: "test4@gmail.com"),
  email(emails: "test5@gmail.com"),
  email(emails: "test6@gmail.com"),
  email(emails: "test7@gmail.com"),
  email(emails: "test8@gmail.com"),
  email(emails: "test9@gmail.com"),
  email(emails: "test10@gmail.com"),
];
List type = ["Super Admin", "Admin", "Member"];
