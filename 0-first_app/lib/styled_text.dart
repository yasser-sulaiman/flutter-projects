import 'package:flutter/material.dart';

class StyledText extends StatelessWidget{
  const StyledText(this.text, {super.key});

  final String text; // should be decleared so the passed value can be stored, final is used to make it immutable

  @override
  Widget build(BuildContext context){
    return Text(
          text,
          style: const TextStyle( // const here is optional and it is used to optimize the performance
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
  }
}