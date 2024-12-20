import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:flutter_gru_chang_thai/shared/colors.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_button_widget.dart';

class GoldGradientBoxItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final GestureTapCallback? onTap;

  const GoldGradientBoxItemWidget({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const double height = 400;
    const double productCodeHeight = 50;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(bottom: productCodeHeight / 2),
                child: Container(
                  decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: colorGoldGradients,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/p3.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: productCodeHeight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GoldGradientButtonWidget(
                            text: title,
                            style: Theme.of(context).textTheme.normal.copyWith(
                                  color: colorBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
