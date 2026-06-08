import 'package:url_launcher/url_launcher.dart' as url_launcher;

extension StringModification on String {
  void launchUrl() {
    try {
      url_launcher.launchUrl(Uri.parse(this));
    } catch (_) {}
  }

   Future<void> openAddressInGoogleMap() async {
  final encodedAddress = Uri.encodeComponent(this);
  final uri = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=$encodedAddress',
  );

  if (!await url_launcher.launchUrl(
    uri,
    mode: url_launcher.LaunchMode.externalApplication, 
  )) {
    throw Exception('Could not launch map');
  }
}

Future<void> openAddressInAppleMap() async {
  final encoded = Uri.encodeComponent(this);
  final uri = Uri.parse("http://maps.apple.com/?q=$encoded");

  if (!await url_launcher.launchUrl(uri, mode: url_launcher.LaunchMode.externalApplication)) {
    throw Exception("Could not open Apple Maps");
  }
}
}
