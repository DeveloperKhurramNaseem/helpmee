import 'package:url_launcher/url_launcher.dart' as url_launcher;

extension StringModification on String {
  void launchUrl() {
    try {
      url_launcher.launchUrl(Uri.parse(this));
    } catch (_) {}
  }
}
