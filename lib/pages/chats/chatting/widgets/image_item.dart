import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:ramflux_app/shared/index.dart';

class ImageItemWidget extends StatelessWidget {
  ImageItemWidget({
    super.key,
    required this.entity,
    required this.option,
    this.onTap,
  });

  final AssetEntity entity;
  final ThumbnailOption option;
  final Function? onTap;

  final Rx<bool> _isSelected = false.obs;

  Widget _buildView() {
    if (entity.type == AssetType.audio) {
      return const Center(
        child: Icon(Icons.audiotrack, size: 30),
      );
    }
    return _buildImageWidget(entity, option);
  }

  Widget _buildImageWidget(
    AssetEntity entity,
    ThumbnailOption option,
  ) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: AssetEntityImage(
            entity,
            isOriginal: false,
            thumbnailSize: option.size,
            thumbnailFormat: option.format,
            fit: BoxFit.cover,
          ),
        ),
        PositionedDirectional(
          top: 4,
          end: 4,
          child: _buildSelectorWidget(entity),
        ),
        PositionedDirectional(
          bottom: 2,
          start: 2,
          end: 2,
          child: Row(
            children: [
              if (entity.isFavorite)
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 16,
                  ),
                ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (entity.isLivePhoto)
                      Container(
                        margin: const EdgeInsetsDirectional.only(end: 4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(2),
                          ),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: const Text(
                          'LIVE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ),
                    Icon(
                      () {
                        switch (entity.type) {
                          case AssetType.other:
                            return Icons.abc;
                          case AssetType.image:
                            return Icons.image;
                          case AssetType.video:
                            return Icons.video_file;
                          case AssetType.audio:
                            return Icons.audiotrack;
                        }
                      }(),
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSelectorWidget(AssetEntity entity) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: _isSelected.value
              ? AppColors.onPrimary.withOpacity(0.8)
              : AppColors.onBackground.withOpacity(0.3),
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.onPrimary,
            width: 1,
          ),
        ),
        child: _isSelected.value
            ? Icon(
                Icons.check_circle,
                color: AppColors.primary,
                size: 16,
              )
            : const SizedBox(
                width: 16,
                height: 16,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _isSelected.value = !_isSelected.value;
        onTap?.call(_isSelected.value);
      },
      child: _buildView(),
    );
  }
}
