import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final double heightInMeters;
  final int weight;

  Result(this.heightInMeters, this.weight);

  @override
  Widget build(BuildContext context) {
    double bmi = weight / (heightInMeters * heightInMeters);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Height: ${heightInMeters.toStringAsFixed(2)} meters",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              "Weight: $weight kg",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              "BMI: ${bmi.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              bmi < 18.5
                  ? "Underweight"
                  : bmi < 24.9
                      ? "Normal weight"
                      : bmi < 29.9
                          ? "Overweight"
                          : "Obesity",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
