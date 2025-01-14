import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemperatureBanner extends StatelessWidget {
  final int temperature;
  const TemperatureBanner({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.08,
      width: Get.width * 0.51,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 15,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.thermostat,
                color: Colors.white,
              ),
              Text(
                "TEMPERATURE :",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Text(
            "$temperature °C",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
