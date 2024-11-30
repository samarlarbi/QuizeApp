import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  final int questionNumber;
  final IconData icon;
  final Color color;

  const Category({
    super.key,
    required this.title,
    required this.questionNumber,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, '/quiz', arguments: {
          'title': title,
          'questionNumber': questionNumber,
          'icon': icon,
          'color': color,
        })
      },
      child: Container(
        
        width: MediaQuery.of(context).size.width * 0.45,
        child: Stack(
          
          clipBehavior: Clip.none, // Allows overflow for the icon
          children: [
            // Box with text
            Container(
              
              padding: const EdgeInsets.only(top: 35, left: 20, bottom: 35),
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(209, 209, 206, 206).withOpacity(0.5),
                    blurRadius: 4,
                    offset: const Offset(5, 5),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "$questionNumber questions",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
            // Icon partially outside
            Positioned(
              top: -30, // Adjust the value to control the overlap
              left: 90,
              right: 0,
              child: Icon(
                icon,
                size: 90,
                weight: 900,
                shadows: [
                  Shadow(
                    color: const Color.fromARGB(255, 66, 66, 66).withOpacity(0.5),
                    blurRadius: 4,
                    offset: const Offset(-2, 2),
                  )
                ],
                color: color.withOpacity(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
