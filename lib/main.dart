import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizeapp/screens/Home_screen.dart';
import 'package:quizeapp/screens/quiz_screen.dart';
import 'package:quizeapp/theme/theme.dart';
import 'package:quizeapp/theme/theme_provider.dart';
import 'api_service.dart';
import 'modules/question_module.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  Question questiond = Question(
      id: '1',
      category: 'Geography',
      title: "what the capital capital capital of France",
      options: {
        'paris': true,
        'gabes': false,
        'NewYork': false,
      });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      initialRoute: '/',
      routes: {
        '/quiz': (context) => QuizScreen(
              question: questiond,
            ),
      },
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
