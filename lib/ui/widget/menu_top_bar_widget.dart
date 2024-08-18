import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/app/app_constant.dart';
import 'package:flutter_gru_chang_thai/app/app_resource.dart';
import 'package:flutter_gru_chang_thai/shared/colors.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/go_router.dart';
import 'package:flutter_gru_chang_thai/utils/dialog_util.dart';
import 'package:flutter_gru_chang_thai/utils/language_util.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'gold_gradient_text_widget.dart';

class MenuTopBarWidget extends StatefulWidget {
  const MenuTopBarWidget({super.key});

  @override
  MenuTopBarWidgetState createState() => MenuTopBarWidgetState();
}

class MenuTopBarWidgetState extends State<MenuTopBarWidget> {
  String currentPath = AppConstant.emptyString;

  final List<Map<String, String>> languageItems = [
    {
      'value': 'th',
      'name': 'ไทย',
      'icon': 'assets/images/icon_thai.png',
    },
    {'value': 'en', 'name': 'English', 'icon': 'assets/images/icon_english.png'},
  ];

  List<Map<String, String>> listMenus = [
    {'name': AppResource.home, 'route': RoutePath.homePage},
    {'name': AppResource.antique, 'route': RoutePath.catalogPage},
    {'name': AppResource.aboutUs, 'route': RoutePath.aboutUsPage},
    {'name': AppResource.contactUs, 'route': RoutePath.contactUsPage},
  ];

  late String? selectedLanguageValue;
  late List<Widget> listMenuWidgets = [];

  @override
  void initState() {
    currentPath = Get.currentRoute;

    selectedLanguageValue = languageItems.first['value'];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        Locale? currentLocale = Get.locale;
        selectedLanguageValue = currentLocale?.languageCode;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return _buildDesktopView();
    }

    return _buildMobileView();
  }

  Widget _buildDesktopView() {
    return Container(
      color: colorBackground.withOpacity(0.5),
      height: 80,
      child: Row(
        children: [
          const Expanded(flex: 1, child: Offstage()),
          Expanded(
            flex: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                    'assets/images/logo_gru_chang_no_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    _buildDesktopMenus(),
                    const SizedBox(width: 30),
                    _buildLanguageDropdown(),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(flex: 1, child: Offstage()),
        ],
      ),
    );
  }

  Widget _buildMobileView() {
    return Container(
      color: colorBackground.withOpacity(0.5),
      height: 80,
      child: Row(
        children: [
          const Expanded(flex: 1, child: Offstage()),
          Expanded(
            flex: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Image.asset(
                    'assets/images/logo_gru_chang_no_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    DialogUtil.showBottomSheet(
                      context,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Menu', style: Theme.of(context).textTheme.large.copyWith(fontWeight: FontWeight.bold)),
                          const Divider(thickness: 0.2),
                          const SizedBox(height: 16),
                          _buildMobileMenus(),
                          const SizedBox(height: 32),
                          Text('Change Language', style: Theme.of(context).textTheme.large.copyWith(fontWeight: FontWeight.bold)),
                          const Divider(thickness: 0.2),
                          const SizedBox(height: 16),
                          _buildLanguageDropdown(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Expanded(flex: 1, child: Offstage()),
        ],
      ),
    );
  }

  Widget _buildDesktopMenus() {
    List<Widget> listWidgets = [];
    for (Map<String, String> item in listMenus) {
      listWidgets.addAll([
        InkWell(
          child: _buildText(item),
          onTap: () {
            Get.toNamed(item['route'] ?? AppConstant.emptyString);
          },
        ),
        const SizedBox(width: 30),
      ]);
    }

    return Row(
      children: listWidgets,
    );
  }

  Widget _buildMobileMenus() {
    List<Widget> listWidgets = [];
    for (Map<String, String> item in listMenus) {
      listWidgets.addAll([
        InkWell(
          child: _buildText(item),
          onTap: () {
            setState(() {
              // context.pop();
              // context.go(menuSelected['route'] ?? AppConstant.emptyString);
            });
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Divider(thickness: 0.2),
        ),
      ]);
    }

    return Column(
      children: listWidgets,
    );
  }

  Widget _buildLanguageDropdown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        isDense: true,
        buttonStyleData: const ButtonStyleData(
          width: 130,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.all(0)),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
          iconSize: 20,
          iconEnabledColor: Colors.yellow,
        ),
        items: languageItems
            .map((item) => DropdownMenuItem<String>(
                  value: item['value'],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 14),
                      Image.asset(
                        item['icon'] ?? AppConstant.emptyString,
                        height: 20,
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          item['name'] ?? AppConstant.emptyString,
                          style: Theme.of(context).textTheme.normal,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        value: selectedLanguageValue,
        onChanged: (value) {
          if (!ResponsiveBreakpoints.of(context).isDesktop) {
            Navigator.of(context).pop();
          }

          setState(() {
            selectedLanguageValue = value;
            LanguageUtil.changeLanguage(context, selectedLanguageValue);
          });
        },
      ),
    );
  }

  Widget _buildText(Map<String, String> item) {
    if (item['route'] == currentPath) {
      return GoldGradientTextWidget(
        text: item['name']?.tr ?? AppConstant.emptyString,
        style: Theme.of(context).textTheme.normal,
      );
    }

    return Text(item['name']?.tr ?? AppConstant.emptyString, style: Theme.of(context).textTheme.normal);
  }
}
