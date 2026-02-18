import 'package:flutter/material.dart';

import '../core/constant/styles.dart';

Widget ageBar(String title, double value, Color color) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 13),
    child: Row(
      children: [
        Container(
          width: 70,
          height: 26,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(title, style: InterRequ),
        ),
        SizedBox(width: 6),
        Expanded(
          child: Container(
            height: 26,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.35),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(child: Text("${value.toInt()}%", style: InterReq)),
          ),
        ),
      ],
    ),
  );
}
