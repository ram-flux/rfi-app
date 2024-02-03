import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class VoiceRecorderWidget extends StatefulWidget {
  const VoiceRecorderWidget({super.key});

  @override
  State<VoiceRecorderWidget> createState() => _VoiceRecorderWidgetState();
}

class _VoiceRecorderWidgetState extends State<VoiceRecorderWidget> {
  RecorderController recorderController = RecorderController();

  final Rx<bool> _isVoiceRecording = false.obs;
  final Rx<bool> _isVoiceRecordingCancel = false.obs;

  Future<void> _record() async {
    _isVoiceRecording.value = true;
    await recorderController.record();
  }

  void _stopRecord() async {
    _isVoiceRecording.value = false;
    await recorderController.stop();
  }

  @override
  void initState() {
    super.initState();
    // Changing android encoder
    recorderController.androidEncoder = AndroidEncoder.opus;
    // Changing android output format
    recorderController.androidOutputFormat = AndroidOutputFormat.ogg;
    // Changing ios encoder
    recorderController.iosEncoder = IosEncoder.kAudioFormatOpus;
  }

  @override
  void dispose() {
    recorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Obx(
          () => SizedBox(
            height: 160,
            width: constraints.maxWidth,
            child: <Widget>[
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _isVoiceRecording.value ? 1 : 0,
                child: Container(
                  width: constraints.maxWidth * 0.8,
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: _isVoiceRecordingCancel.value
                        ? Colors.red[400]!.withOpacity(0.8)
                        : AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: <Widget>[
                    Container(
                      width: 28,
                      height: 28,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.onPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: IconWidget.svg(
                        AssetsIcons.micIconSvg,
                        size: 10,
                        color: _isVoiceRecordingCancel.value
                            ? Colors.red[400]!.withOpacity(0.8)
                            : AppColors.primary,
                      ),
                    ),
                    <Widget>[
                      AudioWaveforms(
                        recorderController: recorderController,
                        size: Size(constraints.maxWidth * 0.5, 25),
                        waveStyle: WaveStyle(
                          waveColor: AppColors.onPrimary,
                          showDurationLabel: false,
                          extendWaveform: true,
                          showMiddleLine: false,
                        ),
                      ),
                      TextWidget.bodySmall(
                        _isVoiceRecordingCancel.value
                            ? LocaleKeys.chatsChattingVoiceRecordCancelText.tr
                            : LocaleKeys.chatsChattingVoiceRecordStopText.tr,
                        color: AppColors.onPrimary,
                      ),
                    ].toColumn(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    SizedBox(
                      width: 20,
                      child: StreamBuilder(
                        stream: recorderController.onCurrentDuration,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final Duration duration = snapshot.data!;
                            return TextWidget.titleSmall(
                              '${duration.inSeconds}″',
                              color: AppColors.onPrimary,
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    )
                  ].toRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onLongPress: _record,
                onLongPressEnd: (details) {
                  if (_isVoiceRecording.value) {
                    _stopRecord();
                  }

                  /// TODO: Send or cancel voice
                },
                onLongPressMoveUpdate: (details) {
                  if (_isVoiceRecording.value) {
                    if ((details.localPosition.dy > 0 &&
                            details.localPosition.dy < 60) &&
                        (details.localPosition.dx < -50 &&
                            details.localPosition.dx > -90)) {
                      _isVoiceRecordingCancel.value = true;
                    } else {
                      _isVoiceRecordingCancel.value = false;
                    }
                    debugPrint('cancel: ${_isVoiceRecordingCancel.value}');
                  }
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: -26,
                      child: TextWidget.bodyMedium(
                        _isVoiceRecording.value
                            ? ''
                            : LocaleKeys.chatsChattingVoiceRecordText.tr,
                        color: AppColors.secondary,
                      ),
                    ),
                    if (_isVoiceRecording.value)
                      Positioned(
                        left: -90,
                        child: ButtonWidget.icon(
                          IconWidget.icon(
                            Icons.close_rounded,
                            size: 20,
                            color: AppColors.onPrimary,
                          ),
                          width: 44,
                          height: 44,
                          backgroundColor: Colors.red[400]!.withOpacity(0.8),
                          borderRadius: 22,
                        ),
                      ),
                    ButtonWidget.icon(
                      IconWidget.svg(
                        AssetsIcons.micIconSvg,
                        size: 30,
                        color: AppColors.onPrimary,
                      ),
                      width: 64,
                      height: 64,
                      backgroundColor: _isVoiceRecording.value
                          ? AppColors.primary.withOpacity(0.5)
                          : AppColors.primary,
                      borderRadius: 32,
                    ),
                  ],
                ),
              ),
            ].toColumn(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
        );
      },
    );
  }
}
