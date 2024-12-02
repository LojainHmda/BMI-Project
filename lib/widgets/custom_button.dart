import 'package:bmi/result_page.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final int height;
  final int weight;

  CustomButton(this.height, this.weight);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          double heightInMeters = height / 100;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Result(heightInMeters, weight),
            ),
          );
        },
        child: Text(
          "Calculate BMI",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFad0a28),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
