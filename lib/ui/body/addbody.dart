import 'package:camera/camera.dart';
import 'package:douyin/ui/util/widgetutil.dart';
import 'package:flutter/material.dart';

class AddBody extends StatefulWidget {
  AddBody();

  @override
  State createState() {
    return AddBodyState();
  }
}

class AddBodyState extends State<AddBody> {
  CameraController controller;
  List<CameraDescription> cameras;

  AddBodyState();

  Future<void> getCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    Future future = getCameras();
    future.whenComplete(() {
      if (cameras != null && cameras.isNotEmpty) {
        onNewCameraSelected(cameras[1]); // 前置摄像头
      }
    });
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    controller.addListener(() {
      if (mounted) setState(() {});
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print(e.description);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return Container(
        color: Colors.black,
      );
    }
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(color: Colors.black, child: createCamera()),
        ),
      ],
    );
  }

  Widget createCamera() {
    return Stack(
      children: <Widget>[
        new Container(
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: CameraPreview(controller),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(top: 50, left: 15),
            child: WidgetUtils.getImage("dy_cancel", 15, 15),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 55),
            child: WidgetUtils.getText("选择音乐", 14.0, Colors.white),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            child: WidgetUtils.getImage("dy_btn_icon", 60, 60),
          ),
        ),
      ],
    );
  }
}
