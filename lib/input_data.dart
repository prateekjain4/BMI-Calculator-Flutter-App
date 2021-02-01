import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottomButton.dart';
import 'roundIconButton.dart';
import 'calculator_brain.dart';

enum GenderType{
  Male,
  Female,
}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
      children: <Widget>[
        Expanded(child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = GenderType.Male;
                  });
                },
                colour: selectedGender == GenderType.Male ? kActiveColor : kInactiveColor,
                cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
              ),
            ),
            Expanded(child: ReusableCard(
              onPress: (){
                setState(() {
                  selectedGender = GenderType.Female;
                });
              },
              colour: selectedGender == GenderType.Female ? kActiveColor : kInactiveColor,
              cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
            ),),
          ],
        )),
        Expanded(child: ReusableCard(
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'HEIGHT',
                style: kLabelTextStyle,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    height.toString(),
                    style: kNumberTextStyle,

                  ),
                  Text(
                    'cm',
                    style: kLabelTextStyle,
                  )
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: Color(0xFFEB1555),
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Color(0xFF8D8E98),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayColor: Color(0x29EB1555),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(value: height.toDouble(),
                    min: 120.0,
                    max: 250.0,
                    onChanged: (double newValue){
                  setState(() {
                    height = newValue.round();
                  });
                    }
                ),
              )
            ],
          ),
          colour: kActiveColor,
        ),),
        Expanded(child: Row(
          children: <Widget>[
            Expanded(child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Weight',
                    style: kLabelTextStyle
                  ),
                  Text(
                    weight.toString(),
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                        setState(() {
                          weight--;
                        });
                      }),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                        setState(() {
                          weight++;
                        });
                      })

                    ],
                  )
                ],
              ),


            ),),
            Expanded(child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'Age',
                      style: kLabelTextStyle
                  ),
                  Text(
                    age.toString(),
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                        setState(() {
                          age--;
                        });
                      }),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                        setState(() {
                          age++;
                        });
                      })

                    ],
                  )
                ],
              ),
            ),
            ),
          ],
        )),
        BottomButton(buttonTitle: 'Calculate', onTap: (){
          CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
            bmiResult: calc.calculateBMI(),
            resultText: calc.getResult(),
            interpretation: calc.getInterpretation(),
          ),
          ),
          );
        })


      ],
    ),



      // We change the theme of any widget by wrapping it with a theme widget

    );
  }
}






// custom widget
// @required makes certain properties required
