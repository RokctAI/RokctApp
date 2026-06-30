import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';

class LauncherAppItem extends StatelessWidget {
  final AppInfo app;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const LauncherAppItem({
    super.key,
    required this.app,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        app.name,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
