import 'package:get/get.dart';

class UpdateRelationController extends GetxController {
  RxString selectedRelation = "".obs;
  void selectRelation(String relation) {
    selectedRelation.value = relation;
  }

  final List<Map<String, dynamic>> relationshipList = [
    {'title': "Single", 'svgName': 'bachelor'},
    {'title': "Relationship", 'svgName': 'love'},
    {'title': "Engaged", 'svgName': 'ring'},
    {'title': "Married", 'svgName': 'wedding'},
    {'title': "Divorced", 'svgName': 'broken-heart'},
    {'title': "Widowed", 'svgName': 'elder'},
  ];
}
