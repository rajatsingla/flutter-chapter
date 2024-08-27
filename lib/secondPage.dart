import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:myapp/appBar.dart';
import 'package:myapp/draggable.dart';
import 'package:myapp/postText.dart';
import 'package:myapp/slider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  bool _isVisible = true; // Variable to track visibility of app bars.
  bool liked = true;
  double _currentFontSize = 16;

  void _toggleAppBar() {
    setState(() {
      _isVisible = !_isVisible;
      if (!_isVisible) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }
    });
  }

  bool notificationHandler(ScrollNotification notification) {
    if (notification is ScrollStartNotification && _isVisible) {
      _toggleAppBar();
    }
    return false;
  }

  void _showDraggableSheet(BuildContext context, String cusHeading) {
    print("yo");

    showModalBottomSheet(
      useRootNavigator: false,
      isScrollControlled: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14.0), // Rounded corners when not fully expanded
        ),
      ),
      elevation: 5.0,
      backgroundColor: const Color.fromARGB(255, 232, 236, 238),
      context: context,
      sheetAnimationStyle: AnimationStyle(
          duration: Duration(milliseconds: 150),
          curve: Curves.fastEaseInToSlowEaseOut,
          reverseDuration: Duration(milliseconds: 150)),
      builder: (_) => CustomWidget(customHeading: cusHeading),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    print("yo");

    showModalBottomSheet(
        useRootNavigator: false,
        // barrierColor: Colors.transparent,
        isScrollControlled: true,
        useSafeArea: true,
        elevation: 5.0,
        showDragHandle: true,
        enableDrag: true,
        context: context,
        sheetAnimationStyle: AnimationStyle(
            duration: Duration(milliseconds: 150),
            curve: Curves.fastEaseInToSlowEaseOut,
            reverseDuration: Duration(milliseconds: 150)),
        builder: (context) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.451, // Start at half the screen height
            minChildSize: 0.01,
            maxChildSize: .46,
            snap: true,
            snapSizes: [0, .45],
            builder: (BuildContext context, scrollController) {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20),
                            SizedBox(height: 20),
                            FontSizeSlider(),
                            SizedBox(height: 20),
                            const Text('Modal BottomSheet'),
                            ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: notificationHandler,
        child: GestureDetector(
          onTap: _toggleAppBar, // Handle tap on the body.
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                child: PostText(),
              ),
              if (_isVisible)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedAppBar(
                    showAppBar: _isVisible,
                    onChapterPress: () =>
                        _showDraggableSheet(context, 'Chapters'),
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _isVisible
          ? PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: BottomAppBar(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          liked = !liked;
                        });
                      },
                      icon: liked
                          ? const Icon(Icons.favorite)
                          : const Icon(
                              Icons.favorite_border,
                              weight: 600,
                            ),
                      label: liked ? const Text('40') : const Text('39'),
                    ),
                    TextButton.icon(
                      onPressed: () => _showDraggableSheet(context, 'Comments'),
                      icon: const Icon(
                        Icons.comment_bank_outlined,
                        weight: 4,
                      ),
                      label: const Text('905'),
                    ),
                    TextButton.icon(
                      onPressed: () => _showModalBottomSheet(context),
                      icon: const Icon(Icons.font_download_sharp),
                      label: const Text(''),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
