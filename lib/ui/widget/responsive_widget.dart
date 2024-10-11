import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return desktop;
    }

    return mobile;
  }
}
