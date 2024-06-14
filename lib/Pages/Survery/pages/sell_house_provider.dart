import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lunarestate/Pages/Survery/surveyData.dart';
import 'package:lunarestate/package_helper/image_picker.dart';

class SellHouseProvider extends ChangeNotifier {
  List<XFile> selectedHouseImages = [];
  Future selectHouseImages() async {
    images.clear();
    List<XFile> limages = await ImagePickerUtil.pickMultipleImages();
    selectedHouseImages.addAll(limages);
    images.addAll(selectedHouseImages);
    notifyListeners();
  }

  removeSelectedImage(int index) {
    selectedHouseImages.removeAt(index);
    images.removeAt(index);
    notifyListeners();
  }
}
