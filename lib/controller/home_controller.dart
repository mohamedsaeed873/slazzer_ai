import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:image_picker/image_picker.dart';

class HomeControllr extends GetxController{
   File? imageBefor;
   Uint8List? imageAfter;
  final picker=ImagePicker();

  Future getImage()async{

    PickedFile? pickedFile =await picker.getImage(source: ImageSource.gallery);
    imageBefor=File(pickedFile!.path);
    update();
  }

  void uploadImage(File file)async{
    String fileName=file.path.split('/').last;
    FormData data = FormData.fromMap({
      "source_image_file":await MultipartFile.fromFile(file.path, filename: fileName),
    });

    Dio dio = Dio();
    var response = await dio.post('https://api.slazzer.com/v2.0/remove_image_background',data: data,options:Options(
      headers: {"API-KEY":"a2c37b7dc3cb4f49b831ef11924c7963"},
      responseType: ResponseType.bytes,
    ));

    print(response.data);
    print(response.headers);
    print(response.statusCode);
    print(response.data.runtimeType);
    imageAfter=response.data;
    update();
  }
}