import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/auth_wrapper.dart';
import 'package:plan_execute/Ui/home/home_screen.dart';
import 'package:plan_execute/Ui/home/objective/create_objective.dart';
import 'package:plan_execute/Ui/home/objective/show_objective.dart';
import 'package:plan_execute/Ui/home/profile/change_password.dart';
import 'package:plan_execute/Ui/home/profile/edit_profile.dart';
import 'package:plan_execute/Ui/new_file.dart';
import 'package:plan_execute/Ui/pages/chat_screen.dart';
import 'package:plan_execute/Ui/pages/create_new_team_page.dart';
import 'package:plan_execute/Ui/pages/forgot_password.dart';
import 'package:plan_execute/Ui/pages/invite_member_page.dart';
import 'package:plan_execute/Ui/pages/notification_setting.dart';
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
  static const String chatNotification = "/chatNotification";
  static const String showObjective = "/showObjective";
  static const String authWrapper = "/";
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    Widget widget;
    switch (settings.name) {
      case authWrapper:
        widget = AuthWrapper();
        break;
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
        if (settings.arguments is bool)
          widget = CreateObjective(
            isEdit: settings.arguments as bool,
          );
        else
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

      case chatNotification:
        widget = ChatNotification();
        break;
      case showObjective:
        widget = ShowObjectivePage();
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
