import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryContainer,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 14),
      child: InputWidget.search(
        hintText: LocaleKeys.commonSearch.tr,
        contentPadding: const EdgeInsetsDirectional.symmetric(vertical: 6),
      ),
    );
  }
}
