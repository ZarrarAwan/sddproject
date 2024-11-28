import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import '../main.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraScreen({super.key, required this.cameras});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> _cameraValue;
  late double deviceHeight;
  late double deviceWith;
  bool isFlashOn = false;
  bool isRearCamera = false;
  File? selectedImage;


  void StartCamera(int camera) {
    _cameraController = CameraController(
        widget.cameras[camera],
        ResolutionPreset.max,
        enableAudio: false,
    );
    _cameraValue = _cameraController.initialize();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StartCamera(0);
  }

  Future PickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }

  void TakePicture() async {
    XFile? image;

    if(_cameraController.value.isTakingPicture || !_cameraController.value.isInitialized){
      return;
    }
    if(isFlashOn == false) {
      await _cameraController.setFlashMode(FlashMode.off);
    } else {
      await _cameraController.setFlashMode(FlashMode.torch);
    }

    image = await _cameraController.takePicture();
    if(_cameraController.value.flashMode == FlashMode.torch) {
      setState(() {
        _cameraController.setFlashMode(FlashMode.off);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWith = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(future: _cameraValue, builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              return SizedBox(
                width: deviceWith,
                height: deviceHeight,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: 100,
                    child: CameraPreview(_cameraController),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
          SafeArea(
              child: Padding(
                  padding: EdgeInsets.only(left: 5, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => SplashScreen(cameras: widget.cameras),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
              ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                            cameras: widget.cameras,
                        ),
                      ),
                    );
                  },
                    child: Image.asset(
                      'Assets/images/icons.png', 
                      height: 130, 
                      width: 130,
                    ),
                ),
                GestureDetector(
                  onTap: () => TakePicture(),
                    child: Image.asset(
                      'Assets/images/circle.png',
                      height: 158,
                      width: 150,
                    ),
                ),
                GestureDetector(
                    onTap: () => PickImageFromGallery(),
                    child: Image.asset(
                      'Assets/images/gallery.png',
                      height: 130,
                      width: 130,
                    ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 5, top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFlashOn = !isFlashOn;
                        });
                      },
                      child: isFlashOn ?
                      Icon(Icons.flash_on, color: Colors.white,) :
                      Icon(Icons.flash_off, color: Colors.white,),
                    ),
                    Gap(10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRearCamera = !isRearCamera;
                        });
                        isRearCamera ? StartCamera(0) : StartCamera(1);
                      },
                      child: isRearCamera ?
                      Icon(Icons.camera_rear, color: Colors.white,) :
                      Icon(Icons.camera_front, color: Colors.white,),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
