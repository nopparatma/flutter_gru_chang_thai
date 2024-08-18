import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static Map<String, String>? enUS;
  static Map<String, String>? thTH;

  static Future<void> loadTranslations() async {
    enUS = await _loadJson('assets/lang/en.json');
    thTH = await _loadJson('assets/lang/th.json');
  }

  static Future<Map<String, String>> _loadJson(String path) async {
    final data = await rootBundle.loadString(path);
    return Map<String, String>.from(json.decode(data));
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS!,
    'th_TH': thTH!,
  };
}
