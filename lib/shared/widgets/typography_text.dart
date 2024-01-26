import 'package:flutter/material.dart';

enum TypographyStyle {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

class TypographyText extends StatelessWidget {
  final String text;
  final TypographyStyle textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final FontWeight? fontWeight;

  const TypographyText(
    this.text, {
    Key? key,
    this.textStyle = TypographyStyle.bodyMedium,
    this.color,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = this.color ?? Theme.of(context).colorScheme.onSurface;
    final TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle style = textTheme.titleLarge!;
    switch (textStyle) {
      case TypographyStyle.displayLarge:
        style = textTheme.displayLarge!;
        break;
      case TypographyStyle.displayMedium:
        style = textTheme.displayMedium!;
        break;
      case TypographyStyle.displaySmall:
        style = textTheme.displaySmall!;
        break;
      case TypographyStyle.headlineLarge:
        style = textTheme.headlineLarge!;
        break;
      case TypographyStyle.headlineMedium:
        style = textTheme.headlineMedium!;
        break;
      case TypographyStyle.headlineSmall:
        style = textTheme.headlineSmall!;
        break;
      case TypographyStyle.titleLarge:
        style = textTheme.titleLarge!;
        break;
      case TypographyStyle.titleMedium:
        style = textTheme.titleMedium!;
        break;
      case TypographyStyle.titleSmall:
        style = textTheme.titleSmall!;
        break;
      case TypographyStyle.bodyLarge:
        style = textTheme.bodyLarge!;
        break;
      case TypographyStyle.bodyMedium:
        style = textTheme.bodyMedium!;
        break;
      case TypographyStyle.bodySmall:
        style = textTheme.bodySmall!;
        break;
      case TypographyStyle.labelLarge:
        style = textTheme.labelLarge!;
        break;
      case TypographyStyle.labelMedium:
        style = textTheme.labelMedium!;
        break;
      case TypographyStyle.labelSmall:
        style = textTheme.labelSmall!;
        break;
    }

    return Text(
      text,
      style: style.copyWith(fontWeight: fontWeight).apply(color: color),
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
