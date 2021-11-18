import 'package:flutter/cupertino.dart';
import 'package:plan_execute/Ui/home/components/common_appbar.dart';
import 'package:plan_execute/data/providers/api_provider.dart';

class BaseNotifier extends ChangeNotifier {
  ApiProvider apiProvider = ApiProvider();
}
