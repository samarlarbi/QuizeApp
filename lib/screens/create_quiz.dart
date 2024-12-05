import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({super.key});

  @override
  State<CreateQuizScreen> createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        titleSpacing: 5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).colorScheme.primary,
        ),
        centerTitle: true,
        title: Text(
          "create quiz",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DarlightButton(
                type: Darlights.DarlightTwo,
                onChange: (ThemeMode theme) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
                options: DarlightTwoOption()),
          ),
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.onBackground,
              ),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                textAlign: TextAlign.center,
                maxLines: null,
                expands: true,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.1,
                  ),
                  hintText: "type question here",
                ),
              ),
            ),
            Column(
              children: [ Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onBackground,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color:Colors.grey,
                              width: 3)),
                      child: ListTile(
                              selectedTileColor: Colors.transparent,
                          title: Text(
                            "type here",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                          ),
                         ),
                    ),],
            )


          ],
        ),
      ),
    );
  }
}
