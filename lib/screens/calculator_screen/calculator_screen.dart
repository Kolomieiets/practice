import 'package:flutter/material.dart';
import 'package:practice_app/resources/calculator_keyboard.dart';
import 'package:practice_app/screens/calculator_screen/components/calculator_buttons.dart';
import 'package:practice_app/screens/calculator_screen/components/calculator_function.dart';
import 'package:practice_app/screens/calculator_screen/components/example_field.dart';
import 'package:practice_app/utils/pop_utils.dart';
import 'package:practice_app/widgets/drawer.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = '/calculator';
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String example = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return PopUtils.onWillPop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        drawer: MyDrawer(),
        body: Column(
          children: [
            ExampleField(example),
            Expanded(
              child: Container(
                child: GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: CalculatorKeyboard.buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                  ),
                  itemBuilder: (context, int index) {
                    return InkWell(
                      onTap: () {
                        if (CalculatorKeyboard.buttons[index] == 'DEL') {
                          if (example != '') {
                            example = example.substring(0, example.length - 1);
                          }
                        } else if (CalculatorKeyboard.buttons[index] == 'C') {
                          example = '';
                        } else if (CalculatorKeyboard.buttons[index] == '=') {
                          example = CalculatorFunction.calculator(example)!;
                          if (example.endsWith('.0')) {
                            example = example.substring(0, example.length - 2);
                          }
                        } else {
                          example += CalculatorKeyboard.buttons[index];
                        }
                        setState(() {});
                      },
                      child: CalculatorButtons(index),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
