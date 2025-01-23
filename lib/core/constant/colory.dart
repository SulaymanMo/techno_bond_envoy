import 'package:flutter/material.dart';

class StatusColors {
  static final Map<String, List<Color>> _statusColorMap = {
    'delivered': [
      Colors.lightGreen.shade50, // Light
      Colors.lightGreen.shade100, // Medium
      Colors.lightGreen.shade900, // Dark
    ],
    'available': [
      Colors.blueGrey.shade50, // Light
      Colors.blueGrey.shade100, // Medium
      Colors.blueGrey.shade900, // Dark
    ],
    'current': [
      Colors.green.shade50, // Light
      Colors.green.shade100, // Medium
      Colors.green.shade900, // Dark
    ],
  };

  // ! Get a specific color grade for a status
  // ! `grade` values: 0 (Light), 1 (Medium), 2 (Dark)
  static Color getColor(String status, int grade) {
    if (_statusColorMap.containsKey(status)) {
      return _statusColorMap[status]?[grade] ?? Colors.black;
    }
    return Colors.black;
  }
}
