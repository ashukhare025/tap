import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap/app/routes/app_pages.dart';
import 'package:tap/core/constant/app_constants.dart';
import 'package:tap/widget/personality_widget.dart';
import '../../../../SVG/svg.dart';
import '../../../../core/constant/styles.dart';
import '../../../../widget/friendship_widget.dart';
import '../../../../widget/gender_widget.dart';

import '../controllers/intro_details_controller.dart';

class IntroDetailsView extends GetView<IntroDetailsController> {
  const IntroDetailsView({super.key});

  // List of all steps
  List<Widget> steps(BuildContext context, IntroDetailsController c) {
    return [
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Oh hey! Let's start with an intro.", style: PopSemiBol),
            SizedBox(height: 30),

            // Obx(
            //   () => Text(
            //     "${controller.name.value.isEmpty ? "Your name" : controller.name.value} is a Cool name",
            //     style: MediumPopMed,
            //   ),
            // ),
            SizedBox(height: 10),
            Text("Your Name", style: PopMed),
            SizedBox(height: 10),
            TextFormField(
              controller: controller.nameController,
              onChanged: (val) {
                controller.name.value = val;
              },
              decoration: InputDecoration(
                hintText: "Enter Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1),
                ),
              ),
            ),
            SizedBox(height: 25),
            Text("Date of Birth", style: MediumBMed),
            SizedBox(height: 12),
            dobPicker(controller),
          ],
        ),
      ),

      // Step 2: Gender selection
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Obx(
            () => Text(
              "${controller.name.value.isEmpty ? "Your name" : controller.name.value} is a Cool name",
              style: PopSemiBol,
            ),
          ),

          SizedBox(height: 8),

          /// SUBTITLE
          Text(
            textAlign: TextAlign.start,
            "We love that you’re here. pick the gender that best describes you, then add more about it if you like.",
            style: RegPopRe,
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenderCard(
                title: "Man",
                icon: Icons.male,
                controller: controller,
              ),
              GenderCard(
                title: "Woman",
                icon: Icons.female,
                controller: controller,
              ),
              GenderCard(
                title: "Non Binary",
                icon: Icons.transgender,
                controller: controller,
              ),
            ],
          ),
          SizedBox(height: 30),

          /// FOOTER NOTE
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "You can always update this later. ",
                  style: RegPopReg,
                ),
                TextSpan(text: "A note about\ngender on Tap.", style: PopSemiB),
              ],
            ),
          ),
        ],
      ),

      // Step 3: Email
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Can we get your email?", style: PopSemiBol),
          SizedBox(height: 10),
          Text(
            "We’ll use this to recover your account ASAP if you can’t log in.",
            style: popReq,
          ),
          SizedBox(height: 10),
          Text("Your Email", style: PopMed),
          SizedBox(height: 10),
          Form(
            key: controller.emailFormKey,
            child: TextFormField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: controller.validateEmail,
              decoration: InputDecoration(
                hintText: "xyz@gmail.com",
                hintStyle: popReqBC,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1),
                ),
              ),
            ),
          ),
        ],
      ),

      // Step 4
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              "What bring you on Tap?",
              style: PopSemiBol,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 20),
          Text(
            textAlign: TextAlign.start,
            "Romance and butterflies or beautiful \nfriendship? choose a mode to find your people. ",
            style: PopRegu,
          ),
          SizedBox(height: 30),
          OptionCard(
            title: "Man",
            subtitle:
                "Find a relationship, something casual, or anything in-between",
            value: "Man",
            controller: controller,
          ),
          OptionCard(
            title: "BFF",
            subtitle: "Make new friends and find your \ncommunity",
            value: "BFF",
            controller: controller,
          ),
          SizedBox(height: 50),
          Container(
            height: 55,
            width: 333,
            color: Color(0XFF20A090),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                "Question and Content need to be Discuss \nwith The Client",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0XFFFFFFFF),
                  color: Color(0XFFFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),

      // Step 5
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text("What bring you on Tap?", style: PopSemiBol),
          ),
          SizedBox(height: 10),
          Text(
            "you do you! Add at least 4 photo, whether it’s you with you pet, eating your fave food, or in a place you love.",
            style: PopRe,
          ),
          SizedBox(height: 15),
          Obx(
            () => GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
              children: List.generate(4, (index) {
                final photo = controller.photos[index];

                return GestureDetector(
                  onTap: () => controller.pickImage(index),
                  child: Stack(
                    children: [
                      // Photo / Add box
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFEEEDEF),
                          borderRadius: BorderRadius.circular(12),
                          image: photo != null
                              ? DecorationImage(
                                  image: FileImage(photo),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: photo == null
                            ? Center(child: Icon(Icons.add, size: 30))
                            : null,
                      ),

                      // Close button (only if image exists)
                      if (photo != null)
                        Positioned(
                          top: 6,
                          right: 6,
                          child: GestureDetector(
                            onTap: () {
                              controller.removePhoto(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.close,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      // Step 6 Relationship
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.favorite, size: 35, color: Color(0XFF2F5D62)),
            SizedBox(height: 10),
            Text("Your Relationship Status?", style: PopSemiBol),
            SizedBox(height: 15),
            Text(
              "You can change this later. It’ll show on \nyour profile.",
              style: PopRe,
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
                          color:
                              controller.selectedRelation.value == item['title']
                              ? Colors.white
                              : Color(0xFFE7E5EA),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color:
                                controller.selectedRelation.value ==
                                    item['title']
                                ? Color(0xFF43116A)
                                : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgHelper.icon(
                              item['svgName'] ?? '',
                              width: 24,
                              height: 24,
                              color:
                                  controller.selectedRelation.value ==
                                      item['title']
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

      // Step 7
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Text("Language You Know?".tr, style: PopSemiBol),
          SizedBox(height: 10),
          Text(
            "You can change this later. It’ll show on \nyour profile.",
            style: PopRe,
          ),
          SizedBox(height: 10),
          Obx(() {
            if (controller.selectedLanguage.value.isEmpty) return SizedBox();

            var lang = controller.allLanguages.firstWhere(
              (e) => e['name'] == controller.selectedLanguage.value,
            );
            return Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(lang['flag']!, style: TextStyle(fontSize: 20)),
                      SizedBox(width: 10),
                      Expanded(child: Text(lang['name']!)),
                      Icon(Icons.check_circle, color: Color(0XFF43116A)),
                    ],
                  ),
                ],
              ),
            );
          }),

          SizedBox(height: 20),

          /// Search
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
                  borderSide: BorderSide(width: 1, color: Color(0XFF000000)),
                ),
              ),
              onChanged: (val) => controller.searchText.value = val,
            ),
          ),
          SizedBox(height: 10),

          /// List
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.filteredLanguages.length,
                itemBuilder: (context, index) {
                  var lang = controller.filteredLanguages[index];
                  bool isSelected =
                      controller.selectedLanguage.value == lang['name'];

                  return ListTile(
                    leading: Text(
                      lang['flag']!,
                      style: TextStyle(fontSize: 22),
                    ),
                    title: Text(lang['name']!),
                    trailing: isSelected
                        ? Icon(Icons.check_circle, color: Color(0XFF43116A))
                        : Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.grey,
                          ),
                    onTap: () => controller.selectLanguage(lang['name']!),
                  );
                },
              );
            }),
          ),
        ],
      ),
      // Step- 8
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("What’s Your Personality?", style: PopSemiBol),
          SizedBox(height: 10),
          Text(
            "You can change this later. It’ll show on \nyour profile.",
            style: PopRe,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PersonalityCard(
                title: "Introvert",
                icon: Icons.psychology,
                controller: controller,
              ),
              PersonalityCard(
                title: "Extrovert",
                icon: Icons.psychology,
                controller: controller,
              ),
            ],
          ),
        ],
      ),
      //Step- 9
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Which vibes describe your energy?", style: PopSemiBol),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text(
                "Select The vibes you enjoy being around. It helps ut match you with similar vibes.",
                style: PopRe,
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => Container(
                width: 343,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(41.63),
                  border: Border.all(
                    width: 0.83,
                    color: const Color(0xff2F5D62),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(controller.moods.length, (index) {
                    bool selected = controller.selectedIndex.value == index;

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedIndex.value = index;
                          controller.changeTab(controller.moods[index]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selected
                                ? Color(0xFF2F5D62)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(40.63),
                          ),
                          child: Text(
                            controller.moods[index],
                            style: TextStyle(
                              color: selected
                                  ? Colors.white
                                  : Color(0XFF525252),
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              fontFamily: AppConstants.fontFamily_Poppins,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 10),
            Obx(() {
              List<String> vibes =
                  controller.vibeCategories[controller.selectedTab.value] ?? [];

              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(vibes.length, (index) {
                  String vibe = vibes[index];
                  bool selected = controller.selectedInterests.contains(vibe);

                  return GestureDetector(
                    onTap: () {
                      controller.toggleInterest(vibe);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: selected ? Color(0XFFE6F3F4) : Color(0XFFEEEDEF),
                        borderRadius: BorderRadius.circular(41),
                        border: Border.all(
                          color: selected
                              ? Color(0XFF2F5D62)
                              : Color(0XFFEEEDEF),
                        ),
                      ),
                      child: Text(vibe, style: RegPop),
                    ),
                  );
                }),
              );
            }),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 21, right: 21, top: 25),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value:
                          controller.currentStep.value / controller.totalSteps,
                      minHeight: 5,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: IndexedStack(
                        index: controller.currentStep.value - 1,
                        children: steps(context, controller),
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),

              // Bottom Next button
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        String text = controller.getBottomText();

                        if (text.isEmpty) return SizedBox();

                        // Step 4 & 5 → Only Text (not clickable)
                        if (controller.isInfoText()) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Text(
                              text,
                              style: Regpop,
                              textAlign: TextAlign.start,
                            ),
                          );
                        }

                        // Step 3,6,7,8,9 → Button
                        return TextButton(
                          onPressed: controller.nextStep,
                          child: Text(text, style: PopSemiBo),
                        );
                      }),

                      /// Right Circle Button
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Color(0xFF2F5D62),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (controller.currentStep.value == 1 &&
                                controller.nameController.text.isEmpty) {
                              Get.snackbar("Error", "Enter Name");
                              return;
                            }

                            if (controller.currentStep.value == 2 &&
                                controller.selectedGender.value.isEmpty) {
                              Get.snackbar("Error", "Select Gender");
                              return;
                            }

                            if (controller.currentStep.value == 3) {
                              if (!controller.emailFormKey.currentState!
                                  .validate()) {
                                return;
                              }

                              // 🔥 POPUP HERE
                              controller.showEmailConfirmPopup();
                              return;
                            }

                            if (controller.currentStep.value == 4) {
                              if (controller.selectedType.value.isEmpty) {
                                Get.snackbar("Error", "Choose Mode");
                                return;
                              }
                            }
                            if (controller.currentStep.value == 5) {
                              if (!controller.validatePhotos()) {
                                return;
                              }
                            }

                            if (controller.currentStep.value == 6 &&
                                controller.selectedRelation.value.isEmpty) {
                              Get.snackbar("Error", "Select Status");
                              return;
                            }

                            if (controller.currentStep.value == 7 &&
                                controller.selectedLanguage.value.isEmpty) {
                              Get.snackbar("Error", "Select Language");
                              return;
                            }

                            if (controller.currentStep.value == 8 &&
                                controller.selectedPersonal.value.isEmpty) {
                              Get.snackbar("Error", "Select Personality");
                              return;
                            }

                            if (controller.currentStep.value == 9 &&
                                controller.selectedInterests.isEmpty) {
                              Get.snackbar("Error", "Select 5 categories");
                              return;
                            }

                            if (controller.currentStep.value == 9) {
                              Get.offAllNamed(Routes.allow);
                              return;
                            }

                            controller.nextStep();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget dobPicker(IntroDetailsController c) {
  return Column(
    children: [
      SizedBox(
        height: 244,
        child: Row(
          children: [
            /// MONTH
            Expanded(
              child: CupertinoPicker(
                itemExtent: 34,
                scrollController: c.monthCtrl,
                onSelectedItemChanged: (i) {
                  c.updateMonth(i + 1);
                },
                children: c.months
                    .map(
                      (m) => Center(
                        child: Obx(
                          () => Text(
                            m,
                            style: TextStyle(
                              fontSize: 18,
                              color: c.months[c.selectedMonth.value - 1] == m
                                  ? Colors.black
                                  : Color(0XFFC2C2C2),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            /// DAY
            Expanded(
              child: CupertinoPicker(
                itemExtent: 34,
                scrollController: c.dayCtrl,
                onSelectedItemChanged: (i) {
                  c.selectedDay.value = i + 1;
                },
                children: c.days
                    .map(
                      (d) => Center(
                        child: Obx(
                          () => Text(
                            d.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: c.selectedDay.value == d
                                  ? Colors.black
                                  : Color(0XFFC2C2C2),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            /// YEAR
            Expanded(
              child: CupertinoPicker(
                itemExtent: 34,
                scrollController: c.yearCtrl,
                onSelectedItemChanged: (i) {
                  c.updateYear(c.years[i]);
                },
                children: c.years
                    .map(
                      (y) => Center(
                        child: Obx(
                          () => Text(
                            y.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: c.selectedYear.value == y
                                  ? Colors.black
                                  : Color(0XFFC2C2C2),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),

      SizedBox(height: 20),

      /// AGE
      Obx(() => Text("Age ${c.age}", style: SemiMix)),
      SizedBox(height: 6),
      Text("This can’t be changed later", style: RegSan),
    ],
  );
}
