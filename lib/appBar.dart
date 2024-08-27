import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class AnimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  //implements PreferredSizeWidget
  const AnimatedAppBar(
      {super.key, required this.showAppBar, required this.onChapterPress});

  final bool showAppBar;
  final dynamic onChapterPress;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // when showAppBar value is true appbar will show with animation
      // when showAppBar value is false appbar will hide with animation
      height: showAppBar ? 80 : 0,
      //adjust your duration
      duration: const Duration(milliseconds: 800),
      child: AppBar(
        title: const Text("Azrael Aurelius"),
        elevation: 10,
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              onChapterPress();
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                  'check out my website https://cheryl97.stck.me/story/229068/Azrael-Aurelius');
              print('share button tapped!');
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
