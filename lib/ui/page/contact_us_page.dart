import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/ui/desktop/contact_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/mobile/contact_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/widget/responsive_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  ContactUsPageState createState() => ContactUsPageState();
}

class ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: DesktopContactUsPage(),
      mobile: MobileContactUsPage(),
    );
  }
}
