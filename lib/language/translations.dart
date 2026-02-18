import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    // English
    'en_US': {'hello': 'Hello', 'welcome': 'Welcome', 'next': 'Next'},

    // Hindi
    'hi_IN': {'hello': 'नमस्ते', 'welcome': 'स्वागत है', 'next': 'आगे'},
  };
}
