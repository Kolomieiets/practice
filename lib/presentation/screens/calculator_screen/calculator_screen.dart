import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/calculator_keyboard.dart';
import 'package:practice_app/presentation/screens/calculator_screen/components/calculator_buttons.dart';
import 'package:practice_app/presentation/screens/calculator_screen/components/calculator_function.dart';
import 'package:practice_app/presentation/screens/calculator_screen/components/example_field.dart';
import 'package:practice_app/presentation/widgets/drawer.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
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
    return MainLayout(
      appBar: AppBar(
        title: Text(
          DictionaryManager.instance.dictionaryCalculatorScreen.title,
        ),
      ),
      drawer: MyDrawer(),
      child: Column(
        children: [
          ExampleField(example),
          Expanded(
            child: Container(
              child: GridView.builder(
                padding: EdgeInsets.all(AppSizes.h10),
                physics: NeverScrollableScrollPhysics(),
                itemCount: CalculatorKeyboard.buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.3,
                  mainAxisSpacing: AppSizes.h5,
                  crossAxisSpacing: AppSizes.w5,
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
    );
  }
}
