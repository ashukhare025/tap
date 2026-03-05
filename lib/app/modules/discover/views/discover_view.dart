import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';

import '../../../../widget/smash.dart';
import '../controllers/discover_controller.dart';

class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0XFFFFFFFF),
        title: Text('Smash & Sip', style: SemiPop),
        centerTitle: true,
        leading: SizedBox(
          width: 14,
          height: 26,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        actions: [
          Image.asset("assets/image/check-out.png", width: 26, height: 22),
          SizedBox(width: 10),
          Icon(Icons.add_circle_outline, size: 26),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(controller.tabs.length, (index) {
                bool isSelected = controller.selectedIndex.value == index;
                return GestureDetector(
                  onTap: () {
                    controller.changeTab(index);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 25,
                        width: 81,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Color(0XFF2F5D62)
                              : Colors.transparent,
                          shape: BoxShape.rectangle,
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            controller.tabs[index],
                            style: PopBoldPo.copyWith(
                              color: isSelected
                                  ? Color(0XFFFFFFFF)
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        width: 85,
                        height: 02,
                        color: isSelected
                            ? Color(0XFF2F5D62) // underline
                            : Colors.transparent,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Obx(() {
              switch (controller.selectedIndex.value) {
                case 0:
                  return discoverTab();

                case 1:
                  return requestTab(controller);

                case 2:
                  return storiesTab(controller);

                case 3:
                  return matchesTab(controller);

                default:
                  return discoverTab();
              }
            }),
          ),

          SizedBox(height: 40),
        ],
      ),
    );
  }
}
