import 'package:get/get.dart';

class UpdateLanguageController extends GetxController {
  var selectedLanguages = <int>[].obs;

  var searchText = ''.obs;

  var languages = [
    {"name": "English (US)", "flag": "assets/image/us.png"},
    {"name": "Español (Spanish)", "flag": "assets/image/spain.png"},
    {"name": "Français (French)", "flag": "assets/image/france.png"},
    {"name": "Deutsch (German)", "flag": "assets/image/German.png"},
    {"name": "Italiano (Italian)", "flag": "assets/image/italian.png"},
    {"name": "हिंदी (Hindi)", "flag": "assets/image/hindi.png"},
    {"name": "தமிழ் (Tamil)", "flag": "assets/image/tamil.png"},
    {"name": "తెలుగు (Telugu)", "flag": "assets/image/telguu.png"},
    {"name": "বাংলা (Bengali)", "flag": "assets/image/bangali.png"},
  ];

  void toggleLanguage(int index) {
    if (selectedLanguages.contains(index)) {
      selectedLanguages.remove(index);
    } else {
      selectedLanguages.add(index);
    }
  }

  List<Map<String, String>> get filteredLanguages {
    if (searchText.value.isEmpty) return languages;
    return languages
        .where(
          (lang) => lang['name']!.toLowerCase().contains(
            searchText.value.toLowerCase(),
          ),
        )
        .toList();
  }
}
