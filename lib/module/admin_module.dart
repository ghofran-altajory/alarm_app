import 'package:flutter/material.dart';

class AdminModule {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const AdminModule({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
