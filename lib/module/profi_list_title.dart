import 'package:flutter/material.dart';

class ProfiListTitlModule {
  final String title;
  final IconData icon;
   final void Function()? onTap;

  const ProfiListTitlModule({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
