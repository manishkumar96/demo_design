import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostController extends GetxController {
  RxList imageFileList = [].obs;
  final picker = ImagePicker();
  var length, remaining = 0.obs;

  getImage() async {
    imageFileList.clear();
    final List<XFile>? selectedImages = (await picker.pickMultiImage());
    update();
    if (selectedImages!.isNotEmpty) {
      imageFileList.value.addAll(selectedImages);
      update();
    }
    var length = imageFileList.length;
    print("length==$length");
    if (length > 3) {
      remaining.value = (length - 3);
      print("remaining==$remaining");
    }
    print("imageFileList=${imageFileList.toString()}");
  }
}
