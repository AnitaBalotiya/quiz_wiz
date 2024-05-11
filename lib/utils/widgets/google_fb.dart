import 'package:flutter/material.dart';

import '../../helper/global.dart';

class GoogleFb extends StatelessWidget {
  final bool google;
  final String img;
  final String title;
  final VoidCallback onTap;

  const GoogleFb(
      {super.key,
      this.google = true,
      required this.img,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(

        //
        decoration: BoxDecoration(
            color: const Color(0XFFe5e5e5), // 0XFF3a86ff
            borderRadius: borderRadius(12)),

        //
        child: InkWell(
            onTap: onTap,

            //
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mq.width * .05, vertical: mq.height * .015),

                //
                child: Row(children: [
                  Image.asset(img, height: mq.height * .03),

                  SizedBox(width: mq.width * .1),

                  //
                  Text(title,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87))
                ]))));
  }
}
