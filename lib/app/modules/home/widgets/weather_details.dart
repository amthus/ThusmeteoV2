// Code de WeatherDetails 

import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {

  final String pressure;
  final String humidity;
  final String windSpeed;

  WeatherDetails({
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildDetailItem(Icons.wb_sunny_outlined, 'Pressure', pressure),
          _buildDetailItem(Icons.air, 'Wind', windSpeed + ' m/s'),
          _buildDetailItem(Icons.water_drop_outlined, 'Humidity', humidity + '%'),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white70)),
        Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }
}