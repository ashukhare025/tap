import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../SVG/svg.dart';
import '../../../../core/constant/styles.dart';
import '../controllers/update_relation_controller.dart';

class UpdateRelationView extends GetView<UpdateRelationController> {
  const UpdateRelationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateRelationView'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100), // important
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Icon(Icons.favorite, size: 35, color: Color(0XFF2F5D62)),
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Text(
                "Update Your Relationship Status?",
                style: PopSemiBol,
              ),
            ),

            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Text(
                "You can change this later. It’ll show on \nyour profile.",
                style: PopRe,
              ),
            ),

            SizedBox(height: 25),

            Obx(
                  () => GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 15,
                childAspectRatio: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  for (var item in controller.relationshipList)
                    GestureDetector(
                      onTap: () =>
                      controller.selectedRelation.value = item['title'],
                      child: Container(
                        decoration: BoxDecoration(
                          color: controller.selectedRelation.value == item['title']
                              ? Colors.white
                              : Color(0xFFE7E5EA),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: controller.selectedRelation.value == item['title']
                                ? Color(0xFF43116A)
                                : Colors.transparent,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgHelper.icon(
                              item['svgName'] ?? '',
                              width: 24,
                              height: 24,
                              color: controller.selectedRelation.value == item['title']
                                  ? Color(0xFF43116A)
                                  : Colors.black,
                            ),
                            SizedBox(height: 8),
                            Text(item['title']),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// 👇 Button always bottom
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: GestureDetector(
            onTap: () {
              print("tapp");
            },
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Color(0XFFE07A5F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text("Update", style: PopMediu),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
