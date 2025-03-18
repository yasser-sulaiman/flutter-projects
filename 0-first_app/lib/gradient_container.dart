// import 'package:first_app/styled_text.dart';
import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

final startAlignment = Alignment.topLeft; // var or const can be used as well
const endAlignment = Alignment.bottomRight; // var or final can be used as well

class GradientContainer extends StatelessWidget {
  // constructor
  const GradientContainer({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        //child: StyledText('Hello, World!, from haho'),
        child: DiceRoller(),
      ),
    );
  }
}
