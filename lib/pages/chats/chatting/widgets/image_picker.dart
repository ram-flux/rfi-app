import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:ramflux_app/shared/index.dart';

import '../index.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  PhotoProvider readProvider = PhotoProvider();

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _scanGalleryList();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _scanGalleryList() async {
    final permissionResult = await PhotoManager.requestPermissionExtend(
        requestOption: PermissionRequestOption(
      androidPermission: AndroidPermission(
        type: readProvider.type,
        mediaLocation: true,
      ),
    ));
    if (!permissionResult.hasAccess) {
      Get.snackbar('no permission', 'no permission');
      return;
    }

    await readProvider.refreshGalleryList();
  }

  Widget _buildItem(int index) {
    final AssetPathEntity item = readProvider.list[index];
    return <Widget>[
      ImageListWidget(path: item).expanded(),
      <Widget>[
        Text(item.name),
        FutureBuilder<int>(
          future: item.assetCountAsync,
          builder: (_, AsyncSnapshot<int> data) {
            if (data.hasData) {
              return Text('(${data.data})');
            }
            return const SizedBox.shrink();
          },
        ),
      ].toRow(),
    ].toColumn();
  }

  Widget _buildView() {
    return Obx(
      () => PageView.builder(
        controller: _pageController,
        itemCount: readProvider.list.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: 260,
          width: constraints.maxWidth,
          child: FutureBuilder(
            future: readProvider.refreshGalleryList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return _buildView();
            },
          ),
        );
      },
    );
  }
}
