import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../values/typedefs.dart';

import '../values/emoji_list.dart';

class EmojiPickerWidget extends StatefulWidget {
  const EmojiPickerWidget({
    super.key,
    required this.onEmojiSelected,
  });

  final StringCallback onEmojiSelected;

  @override
  State<EmojiPickerWidget> createState() => _EmojiPickerWidgetState();
}

class _EmojiPickerWidgetState extends State<EmojiPickerWidget> {
  final ScrollController _scrollController = ScrollController();
  Rx<int> currentPage = 0.obs;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    fillItems(currentPage.value);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      fillItems(currentPage.value);
    }
  }

  void fillItems(int page) {
    currentPage.value++;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: 230,
          width: constraints.maxWidth,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Obx(
              () => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 18,
                  childAspectRatio: 1.0,
                ),
                itemCount: currentPage.value * 6 * 7,
                itemBuilder: (BuildContext context, int index) {
                  return FutureBuilder(
                    future: Future.delayed(
                      const Duration(milliseconds: 10),
                      () => true,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return InkWell(
                          child: SvgPicture.asset(
                            'assets/emoji/modern/${emojiList[index]}.svg',
                          ),
                          onTap: () {
                            widget.onEmojiSelected(emojiList[index]);
                          },
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
