import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/app/app_resource.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/page/about_us/desktop/about_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/about_us/widget/hover_image_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_text_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/header_widget.dart';
import 'package:get/get.dart';

class MobileAboutUsPage extends StatefulWidget {
  const MobileAboutUsPage({super.key});

  @override
  MobileAboutUsPageState createState() => MobileAboutUsPageState();
}

class MobileAboutUsPageState extends State<MobileAboutUsPage> {
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
      title: 'สะท้อนสังคมไทยผ่านทองคำ',
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
      title: 'ทองโบราณกับงานดีไซน์',
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
    return Column(
      children: [
        _buildImage(item),
        const SizedBox(height: 25),
        _buildText(item),
      ],
    );
  }

  Widget _buildText(ContentItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          item.title,
          style: Theme.of(context).textTheme.larger.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 26),
        Text(
          item.desc,
          style: Theme.of(context).textTheme.normal,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildImage(ContentItem item) {
    return HoverImageWidget(
      imageUrl: item.image,
      gifUrl: item.imageGif,
    );
  }
}
