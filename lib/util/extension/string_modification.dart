import 'package:url_launcher/url_launcher.dart' as url_launcher;

extension StringModification on String {
  void launchUrl(){
    url_launcher.launchUrl(Uri.parse(this));
  }
}