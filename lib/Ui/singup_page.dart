import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/components/common_button.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';
import 'package:plan_execute/Ui/signIn_page.dart';
import 'package:plan_execute/constants/colors.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool tmc = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              background,
            ),
            // colorFilter:
            //     ColorFilter.mode(scafolBackgroudColor, BlendMode.color),
            fit: BoxFit.cover),
        // color: Colors.white
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Let's Get Started!",
                    style: theme.textTheme.bodyText1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Plan and Execute",
                  style: theme.textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 40,
                ),
                EditField(
                  leading: Icons.person_outline,
                  hint: "Name",
                ),
                const SizedBox(
                  height: 10,
                ),
                EditField(
                  leading: Icons.email_outlined,
                  hint: "Email",
                ),
                const SizedBox(
                  height: 10,
                ),
                EditField(
                  leading: Icons.lock_outline,
                  hint: "Password",
                ),
                const SizedBox(
                  height: 10,
                ),
                EditField(
                  leading: Icons.lock_outline,
                  hint: "Confirm Password",
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: tmc,
                        onChanged: (val) {
                          setState(() {
                            tmc = val ?? false;
                          });
                        }),
                    Expanded(
                      child: Text(
                        "I agree to the term and service and privacy policy",
                        maxLines: 2,
                        style: theme.textTheme.subtitle2,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonButton(
                  label: "REGISTER",
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account ?  ",
                            style: theme.textTheme.bodyText2),
                        TextSpan(
                            text: "Login here",
                            style: theme.textTheme.subtitle1!
                                .copyWith(color: primaryColor))
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
