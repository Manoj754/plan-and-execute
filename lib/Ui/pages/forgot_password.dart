import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/components/common_button.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Forgot Password",
              style: theme.bodyText1,
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Enter the email address\nassociated with your account.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1!.copyWith(),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "We will email you a link to reset your password.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.grey),
            ),
            const SizedBox(
              height: 30,
            ),
            EditField(
              leading: Icons.mail,
              hint: "Email Address",
            ),
            const SizedBox(
              height: 25,
            ),
            // Container(
            //     width: double.infinity,
            //     margin: EdgeInsets.symmetric(horizontal: 5),
            //     padding: EdgeInsets.symmetric(vertical: 15),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(5),
            //       color: Colors.blue[900],
            //     ),
            //     child: Center(
            //         child: Text(
            //       "Email Password Link Reset",
            //       style: TextStyle(color: Colors.white),
            //     ))),
            CommonButton(
              label: "Email Password Link Reset".toUpperCase(),
            )
          ],
        ),
      ),
    );
  }
}
