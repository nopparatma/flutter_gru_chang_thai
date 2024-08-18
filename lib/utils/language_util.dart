import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_gru_chang_thai/app/app_constant.dart';
import 'package:flutter_gru_chang_thai/utils/string_util.dart';

class LanguageUtil {
  static changeLanguage(BuildContext context, String? language) async {
    const String defaultLanguage = 'th';
    Locale locale = const Locale(defaultLanguage);

    // Default language
    if (StringUtil.isNullOrEmpty(language)) {
      await Get.updateLocale(locale);
      return;
    }

    // Set language
    locale = Locale(language ?? AppConstant.emptyString);
    await Get.updateLocale(locale);
  }
}
