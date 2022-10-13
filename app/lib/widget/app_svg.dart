import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg {
  AppSvg._();

  static Widget asset(String assetName,
      {double? width,
      String? darkAssetName,
      double? height,
      BoxFit fit = BoxFit.contain,
      Color? color,
      alignment = Alignment.center,
      BlendMode colorBlendMode = BlendMode.srcIn,
      String? semanticsLabel}) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
    );
  }

  static Widget network(String url,
      {double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      Color? color,
      alignment = Alignment.center,
      BlendMode colorBlendMode = BlendMode.srcIn,
      String? semanticsLabel}) {
    return Consumer(
      builder: (context, watch, child) => SvgPicture.network(url,
          width: width,
          height: height,
          fit: fit,
          color: color,
          alignment: alignment,
          colorBlendMode: colorBlendMode,
          semanticsLabel: semanticsLabel),
    );
  }
}
