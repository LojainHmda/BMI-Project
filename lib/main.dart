// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bmi/widgets/custom_button.dart';

import 'widgets/gander_type.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int age = 20;
  int weight = 59;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Scaffold(
            backgroundColor: Color.fromARGB(202, 21, 1, 67),
            appBar: AppBar(
                title: const Text(
                  "BMI calculater",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
                backgroundColor: Colors.transparent,
                centerTitle: true),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Gender(),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        AgeWight(
                          "Age",
                          onWeightChanged: (newWeight) {
                            setState(() {
                              age = newWeight;
                            });
                          },
                        ),
                        AgeWight(
                          "Weight",
                          onWeightChanged: (newWeight) {
                            setState(() {
                              weight = newWeight;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: HightContainer(weight)),
                ],
              ),
            )),
      ),
    );
  }
}
class HightContainer extends StatefulWidget {
  int weight;
  HightContainer(
    this.weight,
  );

  @override
  State<HightContainer> createState() => _HightContainerState();
}

class _HightContainerState extends State<HightContainer> {
  int val = 166;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.5)),
            color: Color.fromARGB(255, 40, 8, 95),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Height",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$val",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "cm",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              Slider(
                activeColor: Color(0xFFad0a28),
                value: val.toDouble(),
                min: 100,
                max: 200,
                onChanged: (value) {
                  setState(() {
                    val = value.toInt();
                  });
                },
              ),
              CustomButton(val, widget.weight),
            ],
          ),
        ),
      ),
    );
  }
}

class AgeWight extends StatefulWidget {
  String type;
  final Function(int) onWeightChanged;
  AgeWight(this.type, {required this.onWeightChanged});

  @override
  State<AgeWight> createState() => _AgeWightState();
}

class _AgeWightState extends State<AgeWight> {
  int age = 20, weight = 50;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.5)),
              color: Color.fromARGB(255, 38, 1, 78),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                widget.type,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                widget.type == "Age" ? "$age" : "$weight",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                      onPressed: () {
                        setState(() {
                          if (widget.type == "Age") {
                            age--;
                          } else {
                            weight--;
                          }
                        });
                        if (widget.type == "Weight") {
                          widget.onWeightChanged(weight);
                        }
                      },
                      icon: Icon(Icons.remove)),
                  IconButton.filled(
                      onPressed: () {
                        setState(() {
                          if (widget.type == "Age") {
                            age++;
                          } else {
                            weight++;
                          }
                        });
                        if (widget.type == "Weight") {
                          widget.onWeightChanged(weight);
                        }
                      },
                      icon: Icon(Icons.add))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
