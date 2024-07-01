import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/material.dart';

class WeightGraphWidget extends StatelessWidget {
  const WeightGraphWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5, // Adjust aspect ratio as needed for your design
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: DChartBarO(
              groupList: [
                OrdinalGroup(
                  color: Colors.green,
                  id: '1',
                  data: [
                    OrdinalData(
                      domain: '',
                      measure: 2.5,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    OrdinalData(domain: 'Wed', measure: 1.9),
                    OrdinalData(domain: 'Thu', measure: 1.2),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            // Adjust the top position as needed
            right: 40, bottom: 1, // Adjust the right position as needed
            child: Text(
              "20 jul,2024",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            // Adjust the top position as needed
            // Adjust the right position as needed
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "25 may,2024",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            // Adjust the top position as needed
            left: 40, bottom: 1, // Adjust the right position as needed
            child: Text(
              "10 may,2024",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
