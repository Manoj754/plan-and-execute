import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:plan_execute/constants/colors.dart';
import 'package:plan_execute/data/providers/sp_helper.dart';
import 'package:plan_execute/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  HttpOverrides.global = MyHttpOverrides();
  await SpHelper.setPref();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plan and Excecute',

      theme: ThemeData(
          primarySwatch: MaterialColor(0xff3610ef, primaryColors),
          accentColor: primaryColor,
          dividerColor: Colors.transparent,
          iconTheme: IconThemeData(color: primaryColor.withOpacity(.8)),
          scaffoldBackgroundColor: scafolBackgroudColor,
          dialogBackgroundColor: dialogBackgroundColor,
          textTheme: TextTheme(
            bodyText1: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
            bodyText2: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            headline1: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: darkTextColor.withOpacity(.8)),
            headline2: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: darkTextColor.withOpacity(.8)),
            headline3: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: darkTextColor.withOpacity(.9)),
            headline6: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: darkTextColor.withOpacity(.9)),
            subtitle1: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: darkTextColor.withOpacity(.5)),
            subtitle2: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: darkTextColor.withOpacity(.75)),
          ),
          tabBarTheme: TabBarTheme(
              unselectedLabelColor: Colors.grey,
              labelColor: primaryColor,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: darkTextColor.withOpacity(.8)),
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: darkTextColor.withOpacity(.8))),
          appBarTheme: AppBarTheme(
              backgroundColor: transparentColor,
              elevation: 0,
              titleSpacing: 0,
              brightness: Brightness.light,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: darkTextColor.withOpacity(.8)),
              iconTheme: IconThemeData(color: Colors.black))),

      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.blue,
      // ),
      initialRoute: PageRoutes.authWrapper,
      // home: chat_screen(),
      onGenerateRoute: PageRoutes.routeGenerator,
    );
  }
}

// final ThemeData theme = ThemeData(
//     scaffoldBackgroundColor: scafolBackgroudColor,
//     textTheme: TextTheme(
//         bodyText1: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)));

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
