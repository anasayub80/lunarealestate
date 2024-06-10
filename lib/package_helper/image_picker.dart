import 'dart:developer';

import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  static Future<List<XFile>> pickMultipleImages() async {
    final picker = ImagePicker();
    List<XFile> selectedImages = [];

    try {
      final pickedImages = await picker.pickMultiImage();
      if (selectedImages.length < 10) {
        selectedImages = pickedImages;
      } else {}
    } catch (e) {
      log("Image picking issue ${e.toString()}");
      rethrow;
    }

    return selectedImages;
  }

  Future<XFile?> pickImages(
      {ImageSource? imgSource = ImageSource.gallery}) async {
    final picker = ImagePicker();
    try {
      // final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: imgSource!);

      if (pickedImage != null) {
        return pickedImage;
      } else {
        return null;
      }
    } catch (e) {
      log("Image picking issue ${e.toString()}");
      rethrow;
    }
  }
}
