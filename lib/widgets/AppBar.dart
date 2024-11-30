import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_avatar/random_avatar.dart';

import '../theme/theme_provider.dart';
import 'package:fluttermoji/fluttermoji.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: MediaQuery.of(context).size.width * 0.3,
      leading: Center(
        child: Text(
          "Hi , Ahmed",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      actions: [
        RandomAvatar(
          'saytoonz',
          trBackground: true,
          height: 70,
          width: 70,
        ),
        SizedBox(
          width: 10,
        ),
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: DarlightButton(
        //       type: Darlights.DarlightTwo,
        //       onChange: (ThemeMode theme) {
        //         Provider.of<ThemeProvider>(context, listen: false)
        //             .toggleTheme();
        //       },
        //       options: DarlightTwoOption()),
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
