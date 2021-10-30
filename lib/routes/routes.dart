import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/home/home_screen.dart';
import 'package:plan_execute/Ui/home/objective/create_objective.dart';
import 'package:plan_execute/Ui/home/profile/change_password.dart';
import 'package:plan_execute/Ui/home/profile/edit_profile.dart';
import 'package:plan_execute/Ui/new_file.dart';
import 'package:plan_execute/Ui/pages/chat_screen.dart';
import 'package:plan_execute/Ui/pages/create_new_team_page.dart';
import 'package:plan_execute/Ui/pages/forgot_password.dart';
import 'package:plan_execute/Ui/pages/invite_member_page.dart';
import 'package:plan_execute/Ui/pages/privacy_policy.dart';
import 'package:plan_execute/Ui/pages/team_setting_page.dart';
import 'package:plan_execute/Ui/signIn_page.dart';

class PageRoutes {
  static const String homeScreen = "/homeScreen";
  static const String signInRoute = "/signInRoute";
  static const String editProfile = "/home/editProfile";
  static const String changePassword = "/home/changePassword";
  static const String inviteMemberPage = "/inviteMemberPage";
  static const String forgotPasswordPage = "/forgotPasswordPage";
  static const String createNewTeamPage = "/createNewTeam";
  static const String addObjective = "/addNewObjective";
  static const String chatScreen = "/chatScreen";
  static const String privacyPolicy = "/privacyPolicy";
  static const String teamSetting = "/teamSetting";
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    Widget widget;
    switch (settings.name) {
      case homeScreen:
        widget = HomeWrapper();
        break;
      case signInRoute:
        widget = SignIn();
        break;
      case editProfile:
        widget = EditProfilePage();
        break;
      case changePassword:
        widget = ChangePasswordPage();
        break;
      case inviteMemberPage:
        widget = InviteMemberPage();
        break;
      case forgotPasswordPage:
        widget = ForgotPasswordPage();
        break;
      case createNewTeamPage:
        widget = CreateNewTeamPage();
        break;
      case addObjective:
        widget = CreateObjective();
        break;
      case chatScreen:
        widget = ChatScreen();
        break;
      case privacyPolicy:
        widget = PrivacyPolicy();
        break;
          case teamSetting:
        widget = TeamSettingPage();
        break;

      default:
        widget = Scaffold(
          body: Center(
            child: Text("No Route Found"),
          ),
        );
    }
    return MaterialPageRoute(builder: (context) {
      return widget;
    });
  }
}
