import 'package:url_launcher/url_launcher.dart';

void openWhatsApp(String phoneNumber) async {
  phoneNumber = "+967$phoneNumber";
  final whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");
  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}
