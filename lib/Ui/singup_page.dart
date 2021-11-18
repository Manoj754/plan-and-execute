import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/components/common_button.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';
import 'package:plan_execute/Ui/pages/invite_member_page.dart';
import 'package:plan_execute/Ui/signIn_page.dart';
import 'package:plan_execute/Ui/utils.dart';
import 'package:plan_execute/constants/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plan_execute/data/providers/providers.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool tmc = false;
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passAgainController = TextEditingController();
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
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
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
                    controller: nameController,
                    leading: Icons.person_outline,
                    hint: "Name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EditField(
                    controller: emailController,
                    leading: Icons.email_outlined,
                    hint: "Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EditField(
                    controller: passController,
                    leading: Icons.lock_outline,
                    hint: "Password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EditField(
                    controller: passAgainController,
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
                    onTap: signup,
                    label: isLoading ? "Loading.." : "REGISTER",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.maybePop(context);
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
      ),
    );
  }

  signup() async {
    isLoading = true;
    setState(() {});
    if (nameController.text.length == 0) {
      showToast("Please Enter Name");
      isLoading = false;
      if (mounted) setState(() {});
      return;
    }
    if (!emailValidate(emailController.text)) {
      showToast("Please Enter Valid Email");
      isLoading = false;
      if (mounted) setState(() {});
      return;
    }
    if (passController.text.length == 0) {
      showToast("Enter Password");
      isLoading = false;
      if (mounted) setState(() {});
      return;
    }
    if (passController.text != passAgainController.text) {
      showToast("Password Does Not Match");
      isLoading = false;
      if (mounted) setState(() {});
      return;
    }
    if (!tmc) {
      showToast("Accept Terms To Continue");
      isLoading = false;
      if (mounted) setState(() {});
      return;
    }
    final res = await context.read(authProvider).register(
        nameController.text, emailController.text, passController.text, tmc);
    print(res.toString());
    if (res == true) {
      Navigator.maybePop(context);
    }
    isLoading = false;
    if (mounted) setState(() {});
  }
}
