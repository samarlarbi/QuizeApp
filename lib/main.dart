import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizeapp/screens/Home_screen.dart';
import 'package:quizeapp/screens/quiz_screen.dart';
import 'package:quizeapp/theme/theme.dart';
import 'package:quizeapp/theme/theme_provider.dart';
import 'api_service.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
