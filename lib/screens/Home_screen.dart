import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';
import 'package:quizeapp/constants.dart';
import 'package:quizeapp/theme/theme.dart';
import 'package:quizeapp/widgets/AppBar.dart';
import 'package:quizeapp/widgets/categoryWidget.dart';

import '../api_service.dart';
import '../theme/theme_provider.dart';

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

  void main() async {
    try {
      final message = await ApiService.fetchMessage();
      print('Message from API: $message');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          gradient: Provider.of<ThemeProvider>(context).themeData == darkMode
              ? null
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Theme.of(context).colorScheme.background,
                    Color.fromARGB(207, 229, 240, 249),
                    Color.fromARGB(255, 231, 230, 254),
                    Color.fromARGB(121, 232, 245, 255),
                    Theme.of(context).colorScheme.background,
                  ],
                ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ExpandableCarousel(
                  options: ExpandableCarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                    pauseAutoPlayOnTouch: true,
                    pauseAutoPlayOnManualNavigate: true,
                    pauseAutoPlayInFiniteScroll: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    disableCenter: true,
                    showIndicator: true,
                    floatingIndicator: true,
                    slideIndicator: CircularSlideIndicator(),
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 15, right: 7),
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.music_note_outlined,
                                  size: 70,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "sports",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "15 questions",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/create_quiz');
                      },
                      child: Text(
                        "Create Quiz",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width * 0.45, 50)),
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color.fromARGB(255, 188, 188, 189),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Join Quiz",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width * 0.45, 50)),
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color.fromARGB(255, 143, 153, 226),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                const Wrap(
                  spacing: 10,
                  runSpacing: 25,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Category(
                        color: Color.fromARGB(100, 247, 200, 200),
                        title: "geography",
                        questionNumber: 15,
                        icon: Icons.sports_baseball_rounded),
                    Category(
                        color: Color.fromARGB(100, 247, 234, 200),
                        title: "geography",
                        questionNumber: 15,
                        icon: Icons.music_note),
                    Category(
                        color: Color.fromARGB(98, 247, 221, 200),
                        title: "geography",
                        questionNumber: 15,
                        icon: Icons.public),
                    Category(
                        color: Color.fromARGB(100, 247, 200, 229),
                        title: "geography",
                        questionNumber: 15,
                        icon: Icons.sports_football),
                    Category(
                        color: Color.fromARGB(100, 208, 200, 247),
                        title: "geography",
                        questionNumber: 15,
                        icon: Icons.sports_baseball_rounded),
                    Category(
                        color: Color.fromARGB(100, 247, 200, 200),
                        title: "geography",
                        questionNumber: 15,
                        icon: Icons.piano),
                    Category(
                        color: Color.fromARGB(99, 200, 247, 233),
                        title: "geography",
                        questionNumber: 15,
                        icon: Icons.menu_book_rounded),
                    Category(
                        color: Color.fromARGB(99, 200, 233, 247),
                        title: "geography",
                        questionNumber: 15,
                        icon: Icons.sports_baseball_rounded),
                    Category(
                        color: Color.fromARGB(99, 247, 200, 244),
                        title: "geography",
                        questionNumber: 15,
                        icon: Icons.sports_baseball_rounded),
                    Category(
                        color: Color.fromARGB(99, 209, 200, 247),
                        title: "geography",
                        questionNumber: 15,
                        icon: Icons.sports_baseball_rounded),
                    Category(
                        color: Color.fromARGB(99, 224, 247, 200),
                        title: "geography",
                        questionNumber: 15,
                        icon: Icons.sports_baseball_rounded)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
