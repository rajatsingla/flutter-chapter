import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:myapp/firstPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void onInit() async {
  try {
    var modes = await FlutterDisplayMode.supported;
    modes.forEach(print);
    await FlutterDisplayMode.setHighRefreshRate();
    print("Enabled high refresh mode");
  } catch (e) {
    print("Error setting high refresh rate: $e");
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const FirstPage();
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.system,
    theme: ThemeData(
      brightness: Brightness.light,
      /* light theme settings */
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      /* dark theme settings */
    ),
    home: const MyHomePage(
      title: 'My App',
    ),
  ));
}
