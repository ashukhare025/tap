import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Map<String, String> svgAssets = {
  'bachelor': 'assets/SVG/icon/bachelor.svg',
  'broken-heart': 'assets/SVG/icon/broken-heart.svg',
  'elder': 'assets/SVG/icon/elder.svg',
  'ring': 'assets/SVG/icon/ring.svg',
  'love': 'assets/SVG/icon/love.svg',
  'wedding': 'assets/SVG/icon/wedding.svg',
};

Widget icon(
  String name, {
  double width = 36,
  double height = 36,
  Color? color,
}) {
  final path = svgAssets[name];
  if (path == null) {
    print("SVG key not found: $name");
    return Icon(Icons.error, size: width, color: Colors.red);
  }

  print("Trying to load SVG: $path");

  return SvgPicture.asset(
    path,
    width: width,
    height: height,
    fit: BoxFit.contain,
    colorFilter: color != null
        ? ColorFilter.mode(color, BlendMode.srcIn)
        : null, // ← colorFilter better way hai tint ke liye (color: deprecated ho raha hai newer versions mein)
    placeholderBuilder: (context) => const CircularProgressIndicator(),
  );
}

// SvgPicture.asset(svgAssets['home']!);
