import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';

class CountryPicker {
  //
  static void showPicker(BuildContext context, {required Rx<Country> country}) {
    //
    showCountryPicker(
        context: context,
        useSafeArea: true,
        countryListTheme: CountryListThemeData(

            //
            borderRadius: borderRadius(24),
            backgroundColor: Colors.white,
            bottomSheetHeight: mq.height * .6,

            //
            padding: EdgeInsets.only(
                left: mq.width * .02,
                right: mq.width * .02,
                top: mq.height * .01),

            //
            inputDecoration: InputDecoration(
                prefixIcon: const Icon(CupertinoIcons.search),
                hintText: 'Search',
                isDense: true,
                filled: true,
                fillColor: const Color(0XFFf8f9fa),
                //
                contentPadding: EdgeInsets.symmetric(
                    horizontal: mq.width * .02, vertical: mq.height * .015),

                //
                enabledBorder: enabledBorder,
                focusedBorder: focusedBorder)),
        showPhoneCode:
            true, // optional. Shows phone code before the country name.

        onSelect: (v) => country.value = v);
  }
}
