import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/components/common_button.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';
import 'package:plan_execute/Ui/singup_page.dart';
import 'package:plan_execute/Ui/utils.dart';
import 'package:plan_execute/constants/colors.dart';
import 'package:plan_execute/data/providers/AuthNotifier.dart';
import 'package:plan_execute/data/providers/providers.dart';
import 'package:plan_execute/routes/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

final background = "assets/images/bg4.png";
final BoxDecoration backGroundDecoration = BoxDecoration(
  image: DecorationImage(
      image: AssetImage(
        background,
      ),
      fit: BoxFit.cover),
);

class _SignInState extends State<SignIn> {
  bool remberme = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthNotifier authNotifier;
  bool isLoading = false;
  @override
  void initState() {
    authNotifier = context.read(authProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: backGroundDecoration,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 20,
              // ),
              // Image.asset(
              //   "assets/images/login_image.png",
              //   height: size.height * .4,
              // ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome",
                style: theme.textTheme.bodyText1,
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
                leading: Icons.email_outlined,
                hint: "abc@gmail.com",
                controller: emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              EditField(
                leading: Icons.lock_outline,
                hint: "Password",
                controller: passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                      value: remberme,
                      onChanged: (val) {
                        setState(() {
                          remberme = val ?? false;
                        });
                      }),
                  Text(
                    "Remember me",
                    style: theme.textTheme.subtitle2,
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.forgotPasswordPage);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Forgot Password?",
                      style: theme.textTheme.subtitle1,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CommonButton(
                  // onTap: () {
                  //   Navigator.pushReplacementNamed(
                  //       context, PageRoutes.homeScreen);
                  // },
                  onTap: login,
                  label: isLoading ? "Loading.." : "LOG IN",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignUpPage();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account ?  ",
                          style: theme.textTheme.bodyText2),
                      TextSpan(
                          text: "Sign Up",
                          style: theme.textTheme.subtitle1!
                              .copyWith(color: primaryColor))
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )),
      ),
    );
  }

  Future login() async {
    isLoading = true;
    setState(() {});
    if (!emailValidate(emailController.text)) {
      showToast("Enter valid email");
      isLoading = false;
      if (mounted) setState(() {});
      return;
    }
    if (passwordController.text.length == 0) {
      showToast("Enter password");
      isLoading = false;
      if (mounted) setState(() {});
      return;
    }
    // if (!remberme) {

    // }
    await authNotifier.login(
        emailController.text, passwordController.text, remberme);
    isLoading = false;
    if (mounted) setState(() {});
  }
}
