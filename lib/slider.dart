import 'package:flutter/material.dart';

class FontSizeSlider extends StatefulWidget {
  const FontSizeSlider({super.key});
  @override
  _FontSizeSliderState createState() => _FontSizeSliderState();
}

class _FontSizeSliderState extends State<FontSizeSlider> {
  double _currentSliderValue = 14;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        padding: EdgeInsets.only(
          left: 18,
          right: 18,
          top: 2,
          bottom: 2,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('A', style: TextStyle(fontSize: 14)),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 14,
                    max: 28,
                    divisions: 10, // Divides the range into discrete values
                    label: _currentSliderValue.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
                Text('A', style: TextStyle(fontSize: 28)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
