import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    super.key,
    required this.customHeading,
  });

  final String customHeading;

  @override
  Widget build(BuildContext context) {
    final DraggableScrollableController sheetController =
        DraggableScrollableController();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        print("asdad");
        if (didPop) {
          return;
        }
        print(sheetController.size);
        if (sheetController.size > .6) {
          sheetController.animateTo(
            .6,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
          );
          return;
        }

        if (context.mounted) {
          Navigator.pop(context);
        }
      },
      child: DraggableScrollableActuator(
        child: DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6, // Start at half the screen height
          minChildSize: 0.5,
          maxChildSize: 1,
          snap: true,
          snapSizes: const [.6, 1],
          controller: sheetController,
          builder: (BuildContext context, scrollController) {
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    child: Center(
                      child: Text(
                        customHeading,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'This is the first paragraph. Add your text here to provide more details.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is the second paragraph. Continue adding your content here.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'This is the first paragraph. Add your text here to provide more details.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is the second paragraph. Continue adding your content here.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'This is the first paragraph. Add your text here to provide more details.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is the second paragraph. Continue adding your content here.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'This is the first paragraph. Add your text here to provide more details.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is the second paragraph. Continue adding your content here.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'This is the first paragraph. Add your text here to provide more details.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is the second paragraph. Continue adding your content here.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'This is the first paragraph. Add your text here to provide more details.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is the second paragraph. Continue adding your content here.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'This is the first paragraph. Add your text here to provide more details.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is the second paragraph. Continue adding your content here.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'This is the first paragraph. Add your text here to provide more details.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is the second paragraph. Continue adding your content here.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'This is the first paragraph. Add your text here to provide more details.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is the second paragraph. Continue adding your content here.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'This is the first paragraph. Add your text here to provide more details.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is the second paragraph. Continue adding your content here.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'This is the first paragraph. Add your text here to provide more details.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is the second paragraph. Continue adding your content here.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'This is the first paragraph. Add your text here to provide more details.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is the second paragraph. Continue adding your content here.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
