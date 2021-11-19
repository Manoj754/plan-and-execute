import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plan_execute/data/providers/AuthNotifier.dart';
import 'package:plan_execute/data/providers/objective_notifier.dart';
import 'package:plan_execute/data/providers/team_provider.dart';

final authProvider = ChangeNotifierProvider((_ref) => AuthNotifier());
final teamProvider = ChangeNotifierProvider((_ref) => TeamNotifier());
final objectiveprovider = ChangeNotifierProvider((_ref) => ObjectiveNotifier());
