import 'package:flutter/material.dart';
import '../../const/color.dart';

class HelpBT extends StatelessWidget {
  const HelpBT({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: Container(
  //       width: 200,
  //       height: 100,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: HomeColor.helpBt,
  //         border: Border.all(
  //           color: HomeColor.border,
  //         ),
  //       ),
  //       child: Text(
  //         "HELP",
  //         style: TextStyle(color: HomeColor.font, fontSize: 25),
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 200,
        child: Image.asset('images/help.png'),
      ),
    );
  }
}
