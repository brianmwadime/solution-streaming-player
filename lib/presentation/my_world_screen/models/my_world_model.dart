import 'package:get/get.dart';
import 'list7588f04c625a4aone_item_model.dart';
import 'listavatar_eight_item_model.dart';

class MyWorldModel {
  Rx<String> kuoshwaTxt = Rx('Lorem ipsum dolor sit amet');

  RxList<List7588f04c625a4aoneItemModel> list7588f04c625a4aoneItemList =
      RxList.filled(2, List7588f04c625a4aoneItemModel());

  RxList<ListavatarEightItemModel> listavatarEightItemList =
      RxList.filled(3, ListavatarEightItemModel());
}
