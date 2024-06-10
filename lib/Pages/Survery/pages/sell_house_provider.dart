import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lunarestate/package_helper/image_picker.dart';

class SellHouseProvider extends ChangeNotifier {
  List<XFile> selectedHouseImages = [];
  Future selectHouseImages() async {
    selectedHouseImages = await ImagePickerUtil.pickMultipleImages();
    notifyListeners();
  }

  removeSelectedImage(int index) {
    selectedHouseImages.removeAt(index);
    notifyListeners();
  }
}
