import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  final int questionNumber;
  final IconData icon;
  final Color color;
  const Category(
      {super.key,
      required this.title,
      required this.questionNumber,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(
          child: Wrap(
            spacing: 5,
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                icon,
                weight: 900,
                
                shadows: [
                  Shadow(
                    color:
                        const Color.fromARGB(255, 66, 66, 66).withOpacity(0.5),
                    blurRadius: 4,
                    offset: Offset(-2, 2),
                  )
                ],
                 
                size: 70,
                color: color.withOpacity(1),
              ),
              Text(
                "title",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(questionNumber.toString() + " questions")
            ],
          ),
        ),
      ),
    );
  }
}
