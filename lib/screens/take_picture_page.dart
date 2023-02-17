

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plantationapp/screens/farmer_consent.dart';


class TakePicturePage extends StatefulWidget {
  final CameraDescription camera;
  String year, status, date, district, block, village, farmer, aadhar, phone, gender, farmerdemand;
  Map<String, int> FarmerDemandMap;
  Map<String, int> FarmerDemandMapFruits;

  TakePicturePage(this.year, this.status, this.date, this.district, this.block,
  this.village, this.farmer, this.aadhar, this.phone, this.gender, this.farmerdemand, this.FarmerDemandMap,this.FarmerDemandMapFruits, {required this.camera});


  @override
  _TakePicturePageState createState() => _TakePicturePageState();
}

class _TakePicturePageState extends State<TakePicturePage> {
  late CameraController _cameraController;
  late Future<void> _initializeCameraControllerFuture;

  @override
  void initState() {
    super.initState();

    _cameraController =
        CameraController(widget.camera, ResolutionPreset.medium);

    _initializeCameraControllerFuture = _cameraController.initialize();
  }

  void _takePicture(BuildContext context) async {
    try {
      await _initializeCameraControllerFuture;

      final path =
      join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');

      final image = await _cameraController.takePicture();

      if (!mounted) return;

      // If the picture was taken, display it on a new screen.
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            // Pass the automatically generated path to
            // the DisplayPictureScreen widget.
              widget.year,
              widget.status, widget.date, widget.district, widget.block, widget.village, widget.farmer, widget.aadhar
              , widget.phone, widget.gender, widget.farmerdemand, widget.FarmerDemandMap, widget.FarmerDemandMapFruits,path
          ),
        ),
      );

      //Navigator.pop(context,path);

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      FutureBuilder(
        future: _initializeCameraControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_cameraController);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      SafeArea(
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(Icons.camera),
              onPressed: () {
                _takePicture(context);
              },
            ),
          ),
        ),
      )
    ]);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  String year, status, date, district, block, village, farmer, aadhar, phone, gender, farmerdemand;
  Map<String, int> FarmerDemandMap;
  Map<String, int> FarmerDemandMapFruits;

  DisplayPictureScreen(
      this.year,
      this.status,
      this.date,
      this.district,
      this.block,
      this.village,
      this.farmer,
      this.aadhar,
      this.phone,
      this.gender,
      this.farmerdemand,
      this.FarmerDemandMap,this.FarmerDemandMapFruits,this.imagePath);
  //const DisplayPictureScreen({super.key, required this.imagePath});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Container(
        child: Column(
          children: [
            Container(
              child: Image.file(File(imagePath)),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.red.shade200,
                  child: Icon(
                    Icons.cancel_rounded,
                    size: 35.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {
                     Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FarmerDemandFConsent(year,
                         status, date, district, block, village, farmer, aadhar
                          ,phone, gender, farmerdemand, FarmerDemandMap, FarmerDemandMapFruits, null, ""
                          // Pass the automatically generated path to
                          // the DisplayPictureScreen widget.

                        ),
                      ),
                    );
                  },
                  elevation: 2.0,
                  fillColor: Colors.green.shade300,
                  child: Icon(
                    Icons.check,
                    size: 35.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
              ],
            )
          ],
        ),
      )//Image.file(File(imagePath)),
    );
  }
}
