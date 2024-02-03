import 'package:flutter/material.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ramflux_app/shared/index.dart';

class MnemonicList extends StatefulWidget {
  const MnemonicList({super.key});

  @override
  State<MnemonicList> createState() => _MnemonicListState();
}

class _MnemonicListState extends State<MnemonicList> {
  String randomMnemonic = bip39.generateMnemonic();

  Widget _buildItem(String text, int index) {
    return Chip(
      label: Container(
        width: 90,
        height: 30,
        alignment: Alignment.center,
        child: <Widget>[
          Expanded(
            child: TextWidget.bodyLarge(text).center(),
          ),
          TextWidget.bodySmall(
            "${index + 1}",
            color: AppColors.primary,
          )
        ].toRow(),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      padding: const EdgeInsets.all(0),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> randomMnemonicList = randomMnemonic.split(" ");
    return Wrap(
      spacing: 16,
      runSpacing: 10,
      children: List.generate(
        randomMnemonicList.length,
        (index) => _buildItem(randomMnemonicList[index], index),
      ),
    );
  }
}
