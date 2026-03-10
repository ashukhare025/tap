import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../controllers/update_language_controller.dart';

class UpdateLanguageView extends GetView<UpdateLanguageController> {
  const UpdateLanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text("Language You Know?", style: PopSemiBol),
              SizedBox(height: 10),
              Text(
                "You can change this later. It'll show on \nyour profile.",
                style: popLWC,
              ),
              SizedBox(height: 20),

              /// Search Box
              Container(
                width: 321,
                height: 35,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "You Selected",
                    hintStyle: TextRegular,
                    prefixIcon: Icon(Icons.search, size: 20),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0XFF000000),
                      ),
                    ),
                  ),
                  onChanged: (val) => controller.searchText.value = val,
                ),
              ),
              SizedBox(height: 20),

              /// Language List
              Expanded(
                child: ListView.builder(
                  itemCount: controller.languages.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      bool selected = controller.selectedLanguages.contains(
                        index,
                      );
                      return GestureDetector(
                        onTap: () {
                          controller.toggleLanguage(index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 41,
                          width: 321,
                          decoration: BoxDecoration(
                            color: Color(0XFFEEEDEF),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  controller.languages[index]["name"]!,
                                  style: TextRegular,
                                ),
                              ),
                              Image.asset(
                                controller.languages[index]["flag"]!,
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(width: 12),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey),
                                  color: selected
                                      ? Color(0xff2DBE7F)
                                      : Colors.transparent,
                                ),
                                child: selected
                                    ? Icon(
                                        Icons.check,
                                        size: 15,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),

              /// Update Button
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffD87B5A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
