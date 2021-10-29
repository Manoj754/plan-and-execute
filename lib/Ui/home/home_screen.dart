import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/components/bootom_bar.dart';
import 'package:plan_execute/Ui/home/bottom_navigation/bottom_navigator.dart';
import 'package:plan_execute/Ui/home/bottom_navigation/custom_d.dart';
import 'package:plan_execute/Ui/home/components/common_appbar.dart';
import 'package:plan_execute/Ui/home/components/cutom_drawer.dart';
import 'package:plan_execute/Ui/home/components/member_expansion.dart';
import 'package:plan_execute/Ui/home/components/objective_expension.dart';
import 'package:plan_execute/Ui/home/components/team_expansion.dart';
import 'package:plan_execute/Ui/home/dashboard/dash_board.dart';
import 'package:plan_execute/Ui/home/objective/objective_page.dart';
import 'package:plan_execute/Ui/home/profile/profile_page.dart';
import 'package:plan_execute/constants/colors.dart';

import 'dart:math' as math;

import 'package:plan_execute/data/models/chart_model.dart';
import 'package:plan_execute/data/models/objective_model.dart';
import 'package:plan_execute/main.dart';

final CustomDrawerController drawerController = CustomDrawerController(false);

class HomeWrapper extends StatelessWidget {
  HomeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDrawerWrapper(
      controller: drawerController,
      drawerWidth: MediaQuery.of(context).size.width * .82,
      body: HomePage(),
      drawer: CustomDrawer(),
    );
  }
}

final chartList = <ChartModel>[
  ChartModel(label: "Completed", persontage: 10),
  ChartModel(label: "Missed", persontage: 30),
  ChartModel(label: "Reviewing", persontage: 40),
  ChartModel(label: "Not\nCompleted", persontage: 60),
  ChartModel(label: "In-Progress", persontage: 20),
  ChartModel(label: "Not\nStarted", persontage: 5),
];

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  final CustomBottomNavController _bottomNavController =
      CustomBottomNavController(0);
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // return CustomDrawerWrapper(
    //   drawerWidth: MediaQuery.of(context).size.width * .75,
    //   body: Container(),
    //   drawer: CustomDrawer(),
    // );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        child: CommonAppBar(
          pageNumber: _bottomNavController.val,
        ),
        preferredSize: Size(0, 50),
      ),
      // body: DrawerUserController(
      //   screenIndex: drawerIndex,
      //   drawerWidth: MediaQuery.of(context).size.width * 0.85,
      //   onDrawerCall: (DrawerIndex drawerIndexdata) {
      //     // changeIndex(drawerIndexdata);
      //     //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
      //   },
      //   screenView: screenView,
      //   //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
                child: PageView(
              onPageChanged: (i) {
                print(i);
                _bottomNavController.value = i;
              },
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                const DashBoard(),
                const ObjectivePage(),
                const ProfilePage()
              ],
            )),
            // Expanded(
            //   child: Center(
            //     child: Text("home"),
            //   ),
            // ),
            BottomNavigator(
              controller: controller,
              navController: _bottomNavController,
            ),
          ],
        ),
      ),
      // drawer: CustomDrawer(),
      // bottomNavigationBar:
    );
  }
}

class CustomExpanded extends StatefulWidget {
  CustomExpanded({Key? key}) : super(key: key);

  @override
  _CustomExpandedState createState() => _CustomExpandedState();
}

class _CustomExpandedState extends State<CustomExpanded> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              child: Text("teams"),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ],
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: isExpanded ? 100 : 0,
          color: Colors.amber,
          width: double.infinity,
          child: Image.network(url),
          // child: ,
        )
      ],
    );
  }
}

class SingleChart extends StatelessWidget {
  final ChartModel chartModel;

  const SingleChart({required this.chartModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  // color: FitnessAppTheme.white,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                  border: new Border.all(
                      width: 3, color: Colors.grey.withOpacity(0.2)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      chartModel.label,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 12),
                    ),
                    Text(
                      "${chartModel.persontage} %",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontFamily: FitnessAppTheme.fontName,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 0.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CustomPaint(
                painter: CurvePainter(
                  colors: colors,
                  persontage: chartModel.persontage.toDouble(),
                ),
                child: SizedBox(
                  width: 108,
                  height: 108,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Color> colors = [Colors.blue, HexColor("#8A98E8"), HexColor("#8A98E8")];

class CurvePainter extends CustomPainter {
  final double persontage;
  final List<Color>? colors;

  CurvePainter({
    this.colors,
    this.persontage = 50,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double angle = (360) * (persontage / 100);
    double minStock = 8;
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors ?? [];
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shdowPaint = new Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = minStock;
    final shdowPaintCenter = new Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius =
        math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = minStock + 2;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = minStock + 6;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = minStock + 8;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = minStock;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        paint);

    final gradient1 = new SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = new Paint();
    cPaint..shader = gradient1.createShader(rect);
    cPaint..color = Colors.white;
    cPaint..strokeWidth = minStock / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}
