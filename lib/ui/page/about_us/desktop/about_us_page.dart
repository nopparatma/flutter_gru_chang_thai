import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/app/app_resource.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/page/about_us/widget/hover_image_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_text_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/header_widget.dart';
import 'package:get/get.dart';

class ContentItem {
  final String image;
  final String imageGif;
  final String title;
  final String desc;

  ContentItem({required this.image, required this.imageGif, required this.title, required this.desc});
}

class DesktopAboutUsPage extends StatefulWidget {
  const DesktopAboutUsPage({super.key});

  @override
  DesktopAboutUsPageState createState() => DesktopAboutUsPageState();
}

class DesktopAboutUsPageState extends State<DesktopAboutUsPage> {
  List<ContentItem> listContents = [
    ContentItem(
      image: 'assets/images/about_us_1.png',
      imageGif: 'assets/gifs/about_us_1.gif',
      title: 'ภารกิจร่วมสมัยของ "ช่างทองหลวง"',
      desc: '"ช่างทองหลวง" ไม่ใช่แค่นายช่างทำทองในวัง แต่เป็นตำแหน่งที่สำนักพระราชวังจัดตั้งเมื่อไม่นานนี้ โดยบุคลากรที่จบจากวิทยาลัยช่างทองหลวง มีความรู้ลึกซึ้งด้านเครื่องทองโบราณ\n"ไม่มีช่างทองโบราณเหลือแล้ว ผู้ที่มีความรู้ในวงการทองยุค 30-40 ปีก่อนก็เริ่มลดน้อยลง เราจึงต้องรักษาภูมิปัญญาเครื่องทองของเจ้านายที่โดดเด่นและสวยงาม" - นิพนธ์ ยอดคำปัน ช่างทองหลวงผู้เริ่มต้นจากรุ่นแรกของวิทยาลัย เขามีบทบาทในงานซ่อมแซมและสนับสนุนการเรียนรู้ของรุ่นต่อไป',
    ),
    ContentItem(
      image: 'assets/images/about_us_2.png',
      imageGif: 'assets/gifs/about_us_2.gif',
      title: 'งานของช่างทองหลวง: สะท้อนสังคมไทยผ่านทองคำ',
      desc: 'เริ่มต้นจากนักศึกษารุ่นบุกเบิก นิพนธ์และเพื่อนต้องสร้างองค์ความรู้เอง โดยศึกษาเครื่องทองโบราณจากวัดพระแก้วที่สำนักพระราชวังเปิดให้ศึกษา ซึ่งต้องใช้การสังเกตและลงมือจริง\n"งานซ่อมยากกว่างานสร้าง ถ้าชำรุดจนไม่เห็นของเดิม ก็เก็บเข้าพิพิธภัณฑ์แทน" นิพนธ์อธิบายถึงความท้าทายในการรักษางานศิลป์ของเครื่องทอง',
    ),
    ContentItem(
      image: 'assets/images/about_us_3.png',
      imageGif: 'assets/gifs/about_us_3.gif',
      title: 'การสร้างสรรค์ที่คงคุณค่าในยุคสมัย',
      desc: 'นิพนธ์เชื่อว่างานเครื่องทองยุคใหม่ ควรผสานเทคนิคโบราณกับการออกแบบที่เนี๊ยบ เพื่อบันทึกประวัติศาสตร์ยุคปัจจุบัน ไม่เพียงเพื่อคนไทย แต่ยังสอดคล้องกับรสนิยมต่างชาติ',
    ),
    ContentItem(
      image: 'assets/images/about_us_4.png',
      imageGif: 'assets/images/about_us_4.png',
      title: 'ทางขนาน: ทองโบราณกับงานดีไซน์',
      desc: 'แม้ไทยให้ความสำคัญกับเครื่องทอง แต่การรวมองค์ความรู้สมัยใหม่กับทองโบราณยังทำได้ไม่เต็มที่ การพัฒนาควรผสานให้เกิดเอกลักษณ์ไทยที่ตอบสนองทั้งไทยและต่างชาติ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          title: AppResource.aboutUs.tr,
          fromPage: AppResource.home.tr,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GoldGradientTextWidget(
                text: 'กรุช่างไทย',
                style: Theme.of(context).textTheme.xxLarger,
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  const Expanded(flex: 1, child: Offstage()),
                  Expanded(
                    flex: 20,
                    child: Column(
                      children: [
                        ...listContents.map(
                          (e) => Column(
                            children: [
                              _buildControlWidget(listContents.indexOf(e), e),
                              const SizedBox(height: 50),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Expanded(flex: 1, child: Offstage()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildControlWidget(int index, ContentItem item) {
    final isEvenIndex = (index % 2 == 0);
    final leftWidget = isEvenIndex ? _buildText(item) : _buildImage(item);
    final rightWidget = isEvenIndex ? _buildImage(item) : _buildText(item);

    return SizedBox(
      height: 500,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leftWidget,
          const SizedBox(width: 50),
          rightWidget,
        ],
      ),
    );
  }

  Widget _buildText(ContentItem item) {
    return Expanded(
      flex: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.title,
            style: Theme.of(context).textTheme.xxLarger.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: Text(
                  item.desc,
                  style: Theme.of(context).textTheme.larger,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImage(ContentItem item) {
    return Expanded(
      flex: 5,
      child: HoverImageWidget(
        imageUrl: item.image,
        gifUrl: item.imageGif,
      ),
    );
  }
}
