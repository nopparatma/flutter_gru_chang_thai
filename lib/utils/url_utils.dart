import 'package:url_launcher/url_launcher.dart';

class UrlUtils {
  static Future<void> launchURL(String url) async {
    final Uri urlParse = Uri.parse(url);
    if (await canLaunchUrl(urlParse)) {
      await launchUrl(urlParse);
    } else {
      throw 'Could not launch $url';
    }
  }
}
