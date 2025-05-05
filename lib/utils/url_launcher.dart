// utils/url_launcher_helper.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;

class UrlLauncherHelper {
  static Future<void> launchInNewTab(String url,
      {BuildContext? context}) async {
    try {
      if (kIsWeb) {
        web.window.open(url, '_blank');
        return;
      }

      // Mobile/Desktop implementation
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
          webOnlyWindowName: '_blank',
        );
      } else if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch the URL')),
        );
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to open link')),
        );
      }
    }
  }

  static Future<void> launchEmail(String email, {BuildContext? context}) async {
    await launchInNewTab('mailto:$email', context: context);
  }

  static Future<void> launchPhone(String phone, {BuildContext? context}) async {
    await launchInNewTab('tel:$phone', context: context);
  }

  static Future<void> launchWhatsApp(String phone,
      {BuildContext? context}) async {
    await launchInNewTab('https://wa.me/$phone', context: context);
  }
}
