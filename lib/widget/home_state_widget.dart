import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../app/modules/home/controllers/home_controller.dart';
import '../core/constant/styles.dart';
import 'age_widget.dart';

Widget homeState(HomeController controller) {
  return Obx(
    () => Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [Color(0xFFE6E1F5), Color(0xFFF5F3FA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Live Crowd Insights", style: InterSemiBold),
              Row(
                children: [
                  Icon(Icons.people, size: 18),
                  SizedBox(width: 4),
                  Text(
                    "Active ${controller.activeUsers.value}",
                    style: InterReqular,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 6),

          /// LIVE Badge
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                decoration: BoxDecoration(
                  color: Color(0XFF7A9B63),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("LIVE", style: InterSemi),
              ),
              SizedBox(width: 8),
              Text("Updated 2 min ago", style: InterLight),
            ],
          ),

          SizedBox(height: 16),

          /// Charts Row
          Row(
            children: [
              /// Gender Pie
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender Distribution", style: InterSemiB),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: PieChart(
                      PieChartData(
                        centerSpaceRadius: 30,
                        sectionsSpace: 0,
                        sections: [
                          PieChartSectionData(
                            value: controller.male.value.toDouble(),
                            color: Color(0xFF8FB7BE),
                            title: controller.male.value.toInt().toString(),
                            radius: 38,
                            titleStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          PieChartSectionData(
                            value: controller.female.value.toDouble(),
                            color: Color(0xFFD9A6A0),
                            title: controller.female.value.toInt().toString(),
                            radius: 38,
                            titleStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          PieChartSectionData(
                            value: controller.other.value.toDouble(),
                            color: Color(0xFF9FA8DA),
                            title: controller.other.value.toInt().toString(),
                            radius: 38,
                            titleStyle: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),

              /// Age Groups
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Age Groups", style: InterSemiB),
                    SizedBox(height: 10),

                    ageBar(
                      "18-24",
                      controller.age18_24.value,
                      Color(0xFF7FA6A9),
                    ),
                    ageBar(
                      "25-30",
                      controller.age25_30.value,
                      Color(0xFF6F8F95),
                    ),
                    ageBar(
                      "31-40",
                      controller.age31_40.value,
                      Color(0xFF7E84B5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
