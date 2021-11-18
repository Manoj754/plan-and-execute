import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plan_execute/Ui/home/home_screen.dart';
import 'package:plan_execute/Ui/signIn_page.dart';
import 'package:plan_execute/data/providers/providers.dart';

class AuthWrapper extends HookWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authNotifier = useProvider(authProvider);
    if (authNotifier.userData == null) {
      return SignIn();
    }
    return HomeWrapper();
  }
}
