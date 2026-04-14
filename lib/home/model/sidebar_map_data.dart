import 'package:flutter/material.dart';

class SideBarMapData {
  final String title;
  final IconData icon;
  final String route;
  final bool isSelected;

  SideBarMapData({
    required this.title,
    required this.icon,
    required this.route,
    this.isSelected = false,
  });
}