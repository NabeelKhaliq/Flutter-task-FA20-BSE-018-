import 'package:flutter/material.dart';
import 'containerfile.dart';
class RepeatIcons extends StatelessWidget {
  RepeatIcons({required this.iconData, required this.label});
  final IconData iconData;
  final String label ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFF8D8E98),
          ),

        ),
        Expanded(
          child: RepeatContainerCode(colors: Color(0xFF1D1E33), cardWidget: null, ),

        ),
      ],
    );
  }
}
