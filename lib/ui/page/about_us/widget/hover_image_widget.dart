import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/ui/widget/fade_animation_widget.dart';

class HoverImageWidget extends StatefulWidget {
  final String imageUrl; // The static image URL
  final String gifUrl; // The GIF URL

  const HoverImageWidget({
    super.key,
    required this.imageUrl,
    required this.gifUrl,
  });

  @override
  State createState() => _HoverImageWidgetState();
}

class _HoverImageWidgetState extends State<HoverImageWidget> {
  bool _isHovering = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovering = true;
      }),
      onExit: (_) => setState(() {
        _isHovering = false;
      }),
      child: Image.asset(
        widget.imageUrl,
        key: const ValueKey('image'),
        fit: BoxFit.cover,
      ),
    );
  }
}
