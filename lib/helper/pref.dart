import 'package:hive_flutter/hive_flutter.dart';

class Pref {
  static late Box box;

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    box = await Hive.openBox('data');
  }

  static bool get skipIntro => box.get('skipIntro') ?? false;
  static set skipIntro(bool v) => box.put('skipIntro', v);

  static String? get userId => box.get('userId');
  static set userId(String? v) => box.put('userId', v);

  // static bool get signedIn => box.get('signedIn') ?? false;
  // static set signedIn(bool v) => box.put('signedIn', v);
}
