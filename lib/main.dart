import 'package:flutter/material.dart';
import 'package:nba_flutter_app/config/color_schemes.g.dart';
import 'package:nba_flutter_app/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      title: 'NBA Data App',
      home: const Splash(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(title: 'NBA Teams'),
      },
    );
  }
}
