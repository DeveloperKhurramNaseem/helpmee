import 'package:url_launcher/url_launcher.dart';

Future<void> launchPhone(String number) async{
final Uri url = Uri(scheme: 'tel', path: number);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> launchWhatsapp(String number, {String message = ''}) async{
final Uri url = Uri.parse("https://wa.me/$number?text=${Uri.encodeComponent(message)}");
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not open WhatsApp';
  }
}

