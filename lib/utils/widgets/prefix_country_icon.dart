import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../helper/global.dart';

class PrefixCountryIcon extends StatelessWidget {
  final Country selectedCountry;
  const PrefixCountryIcon({super.key, required this.selectedCountry});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: mq.width * .04, right: 2),

        //
        child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}',

                  //
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),

              //
              SizedBox(
                  height: mq.width * .08,
                  child: VerticalDivider(width: mq.width * .03))
            ]));
  }
}
