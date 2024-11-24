import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      home: Home(),
      theme:  Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String message = 'Loadinggg...';
 
  @override
  void initState() {
    super.initState();
  }

  // Future<void> _fetchMessage() async {
  //   print("Fetching message from the API...");
  //   try {
  //     final fetchedMessage =
  //         await ApiService.fetchMessage().timeout(Duration(seconds: 15));
  //     print("Message fetched successfully: $fetchedMessage");
  //     setState(() {
  //       message = fetchedMessage;
  //     });
  //   } catch (e) {
  //     print("Error fetching message: $e");
  //     setState(() {
  //       message = 'Error: Something went wrong. Please try again later.';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(     
          child: MaterialButton(
        child: Text("hi"),
        onPressed: () {
          Provider.of<ThemeProvider>(context ,listen: false).toggleTheme();
        },
      )),
    );
  }
}
