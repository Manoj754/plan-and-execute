import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/components/common_button.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Change Password",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditField(
                  leading: Icons.lock_outlined,
                  hint: "Current Password",
                ),
                SizedBox(
                  height: 20,
                ),
                EditField(
                  leading: Icons.lock_outlined,
                  hint: "New Password",
                ),
                SizedBox(
                  height: 20,
                ),
                EditField(
                  leading: Icons.lock_outlined,
                  hint: "Confirm Password",
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: CommonButton(
                    onTap: () {
                      Navigator.maybePop(context);
                    },
                    label: "SUBMIT",
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
