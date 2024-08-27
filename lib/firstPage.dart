import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/secondPage.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STCK'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to Chapter'),
          onPressed: () => {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SecondPage(),
                // transitionsBuilder:
                //     (context, animation, secondaryAnimation, child) {
                //   var begin = const Offset(1.0, 0.0);
                //   var end = Offset.zero;
                //   var curve = Curves.easeInOut;

                //   var tween = Tween(begin: begin, end: end)
                //       .chain(CurveTween(curve: curve));
                //   var offsetAnimation = animation.drive(tween);

                //   return SlideTransition(
                //     position: offsetAnimation,
                //     child: child,
                //   );
                // },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return CupertinoPageTransition(
                    primaryRouteAnimation: animation,
                    secondaryRouteAnimation: secondaryAnimation,
                    linearTransition: true,
                    child: child,
                  );
                },
              ),
            ),
          },
        ),
      ),
    );
  }
}
