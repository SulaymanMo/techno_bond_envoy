import 'package:flutter/material.dart';

class StatusColors {
  static final Map<int, List<Color>> _statusColorMap = {
    2: [
      Colors.lightGreen.shade50, // Light
      Colors.lightGreen.shade100, // Medium
      Colors.lightGreen.shade700, // Dark
    ],
    1: [
      Colors.lightBlue.shade50, // Light
      Colors.lightBlue.shade100, // Medium
      Colors.lightBlue.shade700, // Dark
    ],
    0: [
      Colors.indigo.shade50, // Light
      Colors.indigo.shade100, // Medium
      Colors.indigo.shade700, // Dark
    ],
  };

  // 'delivered'
  // 'current'
  // 'available'

  // ! Get a specific color grade for a status
  // ! `grade` values: 0 (Light), 1 (Medium), 2 (Dark)
  static Color getColor(int status, int grade) {
    if (_statusColorMap.containsKey(status)) {
      return _statusColorMap[status]?[grade] ?? Colors.grey.shade600;
    }
    return Colors.grey.shade600;
  }
}
