import 'package:get/get.dart';
import 'category_item_model.dart';

class OnboardingCategoryModel {
  RxList<OnboardingCategoryItemModel> categoryItemList =
      RxList.filled(6, OnboardingCategoryItemModel());
}
