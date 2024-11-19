import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gru_chang_thai/core/bloc/application/application_bloc.dart';
import 'package:flutter_gru_chang_thai/shared/colors.dart';
import 'package:flutter_gru_chang_thai/ui/router.dart';
import 'package:flutter_gru_chang_thai/ui/widget/fade_animation_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/footer_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/menu_top_bar_widget.dart';
import 'package:get/get.dart';

class CommonLayout extends StatefulWidget {
  final Widget child;

  const CommonLayout({
    required this.child,
    super.key,
  });

  @override
  CommonLayoutState createState() => CommonLayoutState();
}

class CommonLayoutState extends State<CommonLayout> {
  List<Widget> listMenuWidgets = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ApplicationState applicationState = context.read<ApplicationBloc>().state;
      if (applicationState.config == null) {
        Get.offAllNamed(RoutePath.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: Stack(
        children: [
          FadeAnimationWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: [
                      widget.child,
                      const FooterWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const MenuTopBarWidget(),
        ],
      ),
    );
  }
}
