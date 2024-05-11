//global object for accessing device screen size

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pref.dart';

late Size mq;

//primary & secondary color
const pColor = Color(0xFF003566);
final pColorWithOp20 = const Color(0xFF003566).withOpacity(.2);
const sColor = Color(0XFFfca311);

const appName = 'QuizWiz';
const packageName = 'com.braingame.quizwiz';

//
String? uid = Pref.userId;

//
BorderRadius borderRadius(double radius) =>
    BorderRadius.all(Radius.circular(radius));

final enabledBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black26),
    borderRadius: borderRadius(26));

final focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black38, width: 1.5),
    borderRadius: borderRadius(26));

final inputFormatter = <TextInputFormatter>[
  FilteringTextInputFormatter.allow(RegExp('[0-9\.]'))
];

const underlineTextStyle = TextStyle(
    decoration: TextDecoration.underline,
    color: pColor,
    decorationColor: pColor,
    fontWeight: FontWeight.bold);

//
extension MyString on String {
  bool get isValid => trim().isNotEmpty;
}

//helper (mapping list with index)
extension FicListExtension<T> on List<T> {
  Iterable<E> mapIndexed<E>(E Function(int index, T item) map) sync* {
    for (var index = 0; index < length; index++) {
      yield map(index, this[index]);
    }
  }
}
