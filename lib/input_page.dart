import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_Card.dart';


const bottomContainerHeight = 80.0;
const reusableCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomBarColor = Color(0xFFEB1555);

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  // 1 = maleCardPressed, 2 = femaleCardPressed
  void updateColor(Gender selectedGender){
    //maleCardPressed
    if(selectedGender == Gender.male){
      if(maleCardColor == inactiveCardColor){
        maleCardColor = reusableCardColor;
        femaleCardColor = inactiveCardColor;
      } else maleCardColor = inactiveCardColor;
    }
    //femaleCarPressed
    if(selectedGender == Gender.female){
      if(femaleCardColor == inactiveCardColor){
        femaleCardColor = reusableCardColor;
        maleCardColor = inactiveCardColor;
      } else femaleCardColor = inactiveCardColor;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColor,
                      cardChild: ReusableIconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColor,
                      cardChild: ReusableIconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              colour: reusableCardColor,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: reusableCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: reusableCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomBarColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

