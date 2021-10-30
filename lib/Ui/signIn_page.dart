import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/components/common_button.dart';
import 'package:plan_execute/Ui/components/edit_field.dart';
import 'package:plan_execute/Ui/singup_page.dart';
import 'package:plan_execute/constants/colors.dart';
import 'package:plan_execute/routes/routes.dart';

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
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, PageRoutes.homeScreen);
                  },
                  label: "LOG IN",
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
}
