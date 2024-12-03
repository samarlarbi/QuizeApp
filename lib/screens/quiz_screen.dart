import 'dart:io';

import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:provider/provider.dart';
import 'package:quizeapp/constants.dart';
import 'package:quizeapp/modules/question_module.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../theme/theme_provider.dart';

// Default Question

// QuizScreen Widget
class QuizScreen extends StatefulWidget {
  final Question question;

  const QuizScreen({
    Key? key,
    required this.question, // Use the constant default question
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool test = false;
  Question question2 = Question(
      id: '2',
      category: 'Geography',
      title: "what the capital capital capital of eygpt ",
      options: {
        'roma': false,
        'gabes': false,
        'kahera': true,
      });
  String? selectedOption;
  bool show_button = false;
  void next(option) {
    setState(() {
      selectedOption = option;
      if (widget.question.options[selectedOption] == true) {
        test = true;
      }
      if (test == true) {
        ///////////sleep here 1 sec
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => QuizScreen(
              question: question2,
            ),
          ),
        );
      } else {
        show_button = true;
      }
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          widget.question.category,
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
      body: Container(
        decoration: BoxDecoration(
          gradient: Provider.of<ThemeProvider>(context).themeData == darkMode
              ? null
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Theme.of(context).colorScheme.background,
                    Color.fromARGB(255, 231, 230, 254),
                    Color.fromARGB(207, 229, 240, 249),
                    Color.fromARGB(121, 232, 245, 255),
                    Theme.of(context).colorScheme.background,
                    Color.fromARGB(255, 231, 230, 254),
                  ],
                ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Text(
              widget.question.id,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: 'arial',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50),
            //     border: Border.all(
            //       color: Colors.grey,
            //       width: 2,
            //     )),
            padding: const EdgeInsets.all(20.0),
            child: LinearProgressBar(
              maxSteps: 6,

              progressType:
                  LinearProgressBar.progressTypeLinear, // Use Linear progress

              currentStep: 1,

              progressColor: Theme.of(context).colorScheme.primary,

              backgroundColor: Colors.grey,
            ),
          ),
          Divider(height: 20, thickness: 1, color: Colors.transparent),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width *
                  1, // 80% of the screen width

              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.onBackground,
              ),
              child: Text(
                widget.question.title + " ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontFamily: 'arial',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(children: [
                ...widget.question.options.keys.map((option) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onBackground,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: selectedOption == option && test
                                  ? correct
                                  : selectedOption != null &&
                                          widget.question.options[option] ==
                                              true
                                      ? correct
                                      : selectedOption == option &&
                                              test == false
                                          ? incorrect
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondaryVariant,
                              width: 3)),
                      child: ListTile(
                          trailing: selectedOption == option && test
                              ? Icon(
                                  Icons.check_circle,
                                  color: correct,
                                )
                              : selectedOption != null &&
                                      widget.question.options[option] == true
                                  ? Icon(
                                      Icons.check_circle,
                                      color: correct,
                                    )
                                  : selectedOption == option && test == false
                                      ? Icon(
                                          Icons.dangerous,
                                          color: incorrect,
                                        )
                                      : null,
                          enabled: selectedOption == null ? true : false,
                          selectedTileColor: Colors.transparent,
                          title: Text(
                            option,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selectedOption == option && test
                                  ? correct
                                  : selectedOption != null &&
                                          widget.question.options[option] ==
                                              true
                                      ? correct
                                      : selectedOption == option &&
                                              test == false
                                          ? incorrect
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondaryVariant,
                            ),
                          ),
                          onTap: () => next(option)),
                    ),
                  );
                }).toList(),
                Divider(height: 20, thickness: 1, color: Colors.transparent),
                show_button
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width * 1, 50),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizScreen(
                                question: question2,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Skipp",
                        ),
                      )
                    : Padding(padding: EdgeInsets.all(1)),
              ]))
        ]),
      ),
    );
  }
}
