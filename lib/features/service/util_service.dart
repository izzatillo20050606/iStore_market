import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> phoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static Future<void> telegram() async {
    String telegramUrl = "https://web.telegram.org/k/#@pdp2005";
    // ignore: unused_local_variable
    final Uri telegram = Uri(
      path: telegramUrl,
    );
  }
}
