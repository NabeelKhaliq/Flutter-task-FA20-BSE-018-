import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icontextfile.dart';
import 'containerfile.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
            children: <Widget>[
              Expanded(
                child: RepeatContainerCode( colors: Color(0xFF1D1E33),),
                cardWidget: RepeatIcons(),
                ),
          Expanded(
            child: RepeatContainerCode(
            colors: Color(0xFF1D1E33),),
           cardWidget: RepeatIcons(
            iconData: FontAwesomeIcons.male,
            label: 'Male',
    ),

          ),
          Expanded(child: Row(
          children: <Widget>[
          Expanded(
            child: RepeatContainerCode(
            colors: Color(0xFF1D1E33),),
            iconData: FontAwesomeIcons.Female,
            label: 'Female',
          ),
          Expanded(
            child: RepeatContainerCode(colors: Color(0xFF1D1E33),),

          ),
        ],
      ),
          ),
        ],
      ),
    );
  }
}

