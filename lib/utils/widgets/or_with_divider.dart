import 'package:flutter/material.dart';

class OrWithDivider extends StatelessWidget {
  const OrWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Expanded(child: Divider()),

      //
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 5), child: Text('Or With')),

      //
      Expanded(child: Divider())
    ]);
  }
}
