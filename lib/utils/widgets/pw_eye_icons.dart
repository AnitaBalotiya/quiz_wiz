import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PwEyeIcon extends StatelessWidget {
  final VoidCallback onTap;
  final bool obscure;
  const PwEyeIcon({super.key, required this.onTap, required this.obscure});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        icon: Icon(obscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
            size: 22));
  }
}
