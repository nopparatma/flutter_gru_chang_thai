import 'package:flutter/material.dart';

class FadeAnimationWidget extends StatefulWidget {
  final Widget child;

  const FadeAnimationWidget({super.key, required this.child});

  @override
  FadeAnimationWidgetState createState() => FadeAnimationWidgetState();
}

class FadeAnimationWidgetState extends State<FadeAnimationWidget> {
  bool isShow = false;

  @override
  void initState() {
    super.initState();

    setShowContent();
  }

  Future<void> setShowContent() async {
    await Future.delayed(const Duration(milliseconds: 100));

    setState(() {
      isShow = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isShow ? 1.0 : 0.0,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: widget.child,
    );
  }
}
