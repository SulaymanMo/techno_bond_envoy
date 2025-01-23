import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  NavigatorState get nav => Navigator.of(this);
  FocusScopeNode get scope => FocusScope.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}
