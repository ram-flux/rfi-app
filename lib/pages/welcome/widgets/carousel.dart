import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;

  final List<SliderModel> sliderList = [
    SliderModel(
      '开启 Web3 大门',
      '我们遵循所有数据权利归属自己所有，所以我们使用钱包机制创建独立的账户',
    ),
    SliderModel(
      '开启 Web3 大门',
      '我们遵循所有数据权利归属自己所有，所以我们使用钱包机制创建独立的账户',
    ),
    SliderModel(
      '开启 Web3 大门',
      '我们遵循所有数据权利归属自己所有，所以我们使用钱包机制创建独立的账户',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> sliders = sliderList
        .map((item) => Builder(
              builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TypographyText(
                      LocaleKeys.welcomeTitle.tr,
                      textStyle: TypographyStyle.displaySmall,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TypographyText(
                      LocaleKeys.welcomeSubtitle.tr,
                      textStyle: TypographyStyle.titleMedium,
                      textAlign: TextAlign.center,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                );
              },
            ))
        .toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: CarouselSlider(
            items: sliders,
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, _) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: sliders.asMap().entries.map((entry) {
            bool isActive = _current == entry.key;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isActive ? 58.0 : 24.0,
              height: 10.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (Theme.of(context).colorScheme.primary)
                    .withOpacity(isActive ? 1.0 : 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class SliderModel {
  final String title;
  final String subtitle;

  SliderModel(this.title, this.subtitle);
}
