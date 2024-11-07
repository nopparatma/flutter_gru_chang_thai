import 'package:get/get.dart';

class ArgumentUtils {
  static T? getArgument<T>(String key, {T? defaultValue}) {
    final args = Get.arguments;

    if (args != null && args.containsKey(key)) {
      return args[key] as T;
    }

    return defaultValue;
  }
}
