import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlatformSvgWidget {
  static Widget asset(String? assetName,
      {double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      Color? color,
      alignment = Alignment.center,
      BlendMode colorBlendMode = BlendMode.srcIn,
      String? semanticsLabel}) {
    return SvgPicture.asset(assetName ?? '',
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        colorBlendMode: colorBlendMode,
        semanticsLabel: semanticsLabel);
  }
}
