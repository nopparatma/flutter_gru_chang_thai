import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_gru_chang_thai/app/app_config.dart';
import 'package:flutter_gru_chang_thai/utils/string_util.dart';

class ImageUtil {
  static Uint8List convertBase64Image(String base64String) {
    return const Base64Decoder().convert(base64String.split(',').last);
  }

  static String getForwardUrl(String url) {
    if (StringUtil.isNullOrEmpty(url)) return '';
    var appConfig = AppConfig.instance;
    return '${appConfig.gruChangThaiApiServerUrl}/forward?url=$url';
  }
}
