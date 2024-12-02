import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  bool selectedMale = false;
  bool selectedFemale = false;

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedMale = !selectedMale;
                  if (selectedMale) {
                    selectedFemale = false;
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedMale
                        ? Color(0xFFad0a28)
                        : Color.fromARGB(255, 38, 1, 78),
                    borderRadius: BorderRadius.all(Radius.circular(12.5)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.male, size: 100, color: Colors.white),
                      Text(
                        "Male",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedFemale = !selectedFemale;
                  if (selectedFemale) {
                    selectedMale = false;
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedFemale
                        ? Color(0xFFad0a28)
                        : Color.fromARGB(255, 38, 1, 78),
                    borderRadius: BorderRadius.all(Radius.circular(12.5)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.female, size: 100, color: Colors.white),
                      Text(
                        "Female",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
    );
  }
}
