import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

import '../index.dart';

class ImageListWidget extends StatefulWidget {
  const ImageListWidget({super.key, required this.path});

  final AssetPathEntity path;

  @override
  State<ImageListWidget> createState() => _ImageListWidgetState();
}

class _ImageListWidgetState extends State<ImageListWidget> {
  AssetPathEntity get path => widget.path;

  PhotoProvider photoProvider = PhotoProvider();
  late AssetPathProvider assetPathProvider;

  @override
  void initState() {
    super.initState();
    assetPathProvider = AssetPathProvider(path);
    path.getAssetListRange(start: 0, end: 1).then((List<AssetEntity> value) {
      if (value.isEmpty) {
        return;
      }
      if (mounted) {
        return;
      }
      PhotoCachingManager().requestCacheAssets(
        assets: value,
        option: thumbOption,
      );
    });
  }

  ThumbnailOption get thumbOption => ThumbnailOption(
        size: const ThumbnailSize.square(200),
        format: photoProvider.thumbFormat,
      );

  Widget _buildRefreshIndicator(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _onRefresh(),
      child: Scrollbar(
        child: CustomScrollView(
          slivers: <Widget>[
            Obx(
              () => SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) => _buildItem(index),
                  childCount: assetPathProvider.showItemCount,
                  findChildIndexCallback: (Key? key) {
                    if (key is ValueKey<String>) {
                      return findChildIndexBuilder(
                        id: key.value,
                        assets: assetPathProvider.list,
                      );
                    }
                    return null;
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2,
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int findChildIndexBuilder({
    required String id,
    required List<AssetEntity> assets,
  }) {
    return assets.indexWhere((AssetEntity e) => e.id == id);
  }

  Future<void> _onRefresh() async {
    if (!mounted) {
      return;
    }
    await assetPathProvider.onRefresh();
  }

  Future<void> onLoadMore() async {
    if (!mounted) {
      return;
    }
    await assetPathProvider.onLoadMore();
  }

  Widget _buildItem(int index) {
    final List<AssetEntity> list = assetPathProvider.list;
    if (list.length == index) {
      onLoadMore();
      return const CircularProgressIndicator();
    }
    if (index > list.length) {
      return const SizedBox.shrink();
    }
    AssetEntity entity = list[index];
    return ImageItemWidget(
      key: ValueKey<int>(entity.hashCode),
      entity: entity,
      option: thumbOption,
    );
  }

  @override
  void dispose() {
    PhotoCachingManager().cancelCacheRequest();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildRefreshIndicator(context);
  }
}
