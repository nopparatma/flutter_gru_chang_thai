import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:flutter_gru_chang_thai/shared/colors.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String hintText;
  final int? maxLine;

  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    this.maxLine = 1,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.normal.copyWith(color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
        focusedBorder: const GradientOutlineInputBorder(
          gradient: LinearGradient(colors: colorGoldGradients),
          width: 2,
        ),
      ),
      cursorColor: Colors.white,
      maxLines: widget.maxLine,
    );
  }
}
