import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:slazzer_ai/controller/home_controller.dart';

class HomePage extends GetView<HomeControllr> {
  HomePage({Key? key}) : super(key: key);
  HomeControllr controllrt = Get.put(HomeControllr());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('slazzer ai app'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: Colors.red,
                  onPressed: () {
                    controllrt.getImage();
                  },
                  child: Text('pick file',style: TextStyle(color: Colors.white),)),
              GetBuilder<HomeControllr>(
                  init: HomeControllr(),
                  builder: (controllrt) {
                    return Center(
                      child: controllrt.imageBefor == null
                          ? Text('plz picke image')
                          : Image.file(controllrt.imageBefor!),
                    );
                  }),
              RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    controllrt.uploadImage(controllrt.imageBefor!);
                  },
                  child: Text('upload file',style: TextStyle(color: Colors.white),)),
              GetBuilder<HomeControllr>(
                  init: HomeControllr(),
                  builder: (controllrt) {
                    return Center(
                 child: controllrt.imageAfter == null
                      ? CircularProgressIndicator()
                      : Image.memory(controllrt.imageAfter!)) ;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
//Center(
//                   child: controllrt.imageAfter == null
//                       ? CircularProgressIndicator()
//                       : Image.memory(controllrt.imageAfter))