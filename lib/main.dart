import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tetris/UI/game.screen.dart';
import 'package:tetris/UI/size.config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.dark()),
      home: ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < SizeConfig.tabletBreakPoint)
          return GameScreen();
        else if (constraints.maxWidth >= SizeConfig.tabletBreakPoint &&
            constraints.maxWidth < SizeConfig.desktopBreakPoint)
          return Center(
            child: Text("tablet"),
          );
        else
          return Center(child: Text("desktop"));
      },
    );
  }
}
