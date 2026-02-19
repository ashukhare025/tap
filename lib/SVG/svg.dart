import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgHelper {
  static const Map<String, String> svgAssets = {
    'bachelor':
        'assets/svg/icon/boy_24dp_1F1F1F_FILL0_wght400_GRAD0_opsz24.svg',
    'broken-heart':
        'assets/svg/icon/heart_broken_24dp_1F1F1F_FILL0_wght400_GRAD0_opsz24.svg',
    'elder': 'assets/svg/icon/woman_24dp_1F1F1F_FILL0_wght400_GRAD0_opsz24.svg',
    'ring': 'assets/svg/icon/ring-diamond.svg',
    'love':
        'assets/svg/icon/partner_heart_24dp_1F1F1F_FILL0_wght400_GRAD0_opsz24.svg',
    'wedding': 'assets/svg/icon/rings-wedding.svg',
  };

  static Widget icon(
    String name, {
    double width = 24,
    double height = 24,
    Color? color,
  }) {
    final path = svgAssets[name];

    if (path == null) {
      print("SVG key not found: $name");
      return const Icon(Icons.error, color: Colors.red);
    }

    print("Trying to load SVG: $path");

    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }
}
