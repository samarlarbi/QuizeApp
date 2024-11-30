import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:provider/provider.dart';
import 'package:quizeapp/constants.dart';
import 'package:quizeapp/modules/question_module.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import '../theme/theme_provider.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String level = "level 1 ";
  bool test = false;
  final Question question = Question(
      id: '1',
      category: 'Geography',
      title: "what the capital capital capital of France",
      options: {
        'paris': true,
        'gabes': false,
        'NewYork': false,
      });

  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        titleSpacing: 5,
        leading: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.primary,
        ),
        centerTitle: true,
        title: Text(
          question.category,
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
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          child: Text(
            level,
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
              question.title + " ?",
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
              ...question.options.keys.map((option) {
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
                                        question.options[option] == true
                                    ? correct
                                    : selectedOption == option && test == false
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
                                    question.options[option] == true
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
                                        question.options[option] == true
                                    ? correct
                                    : selectedOption == option && test == false
                                        ? incorrect
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondaryVariant,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedOption = option;
                            if (question.options[selectedOption] == true) {
                              test = true;
                            }
                          });
                        }),
                  ),
                );
              }).toList(),
              Divider(height: 20, thickness: 1, color: Colors.transparent),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  fixedSize: Size(MediaQuery.of(context).size.width * 1, 50),
                ),
                onPressed: () {},
                child: Text(
                  "Next",
                ),
              ),
            ]))
      ]),
    );
  }
}
