import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image/image.dart' as Img;

import 'farmer_consent.dart';


class TakeImageFromCamera2 extends StatefulWidget {

  String year, status, date, district, block, village, farmer, aadhar, phone, gender, farmerdemand;
  Map<String, int> FarmerDemandMap;
  Map<String, int> FarmerDemandMapFruits;

  TakeImageFromCamera2(this.year, this.status, this.date, this.district, this.block,
      this.village, this.farmer, this.aadhar, this.phone, this.gender, this.farmerdemand, this.FarmerDemandMap, this.FarmerDemandMapFruits);

  @override
  State<TakeImageFromCamera2> createState() => _TakeImageFromCamera2State();
}

class _TakeImageFromCamera2State extends State<TakeImageFromCamera2> {


  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if(cameras != null){
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }else{
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text("Capture Image from Camera"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
          shrinkWrap: true,
          children: [

      Container(

          child: Column(
              children:[
                Container(
                    height:300,
                    width:400,
                    child: controller == null?
                    Center(child:Text("Loading Camera...")):
                    !controller!.value.isInitialized?
                    Center(
                      child: CircularProgressIndicator(),
                    ):
                    CameraPreview(controller!)
                ),

                ElevatedButton.icon( //image capture button
                  onPressed: () async{
                    try {
                      if(controller != null){ //check if contrller is not null
                        if(controller!.value.isInitialized){ //check if controller is initialized
                          image = await controller!.takePicture(); //capture image
                          setState(() async {
                            //update UI
                            final File? imagefile = File(image!.path);
                            Map<String, File> map1 =  {'image': imagefile!};
                            SharedPreferences.setMockInitialValues(map1);

                            var image1 = await ImagePicker().getImage(source:ImageSource.camera);
                            if(image1 == null)
                              return;

                            GallerySaver.saveImage(image1.path);


                          });


                          //convert XFile to File
                          //final File? imagefile = File(image.path);


                          Directory directory = await getTemporaryDirectory();

                          File? mFile;
                          //mFile = await _saveImageToDisk(image!.path, directory);
                          Map map = Map();
                          map['path'] = image!.path;
                          map['directory'] = directory;
                          mFile = await _saveImageToDisk(map, directory);
                          print("succcc"+mFile.toString());
                          //mFile = await compute(_saveImageToDisk, map);

                          final tempDir = await getTemporaryDirectory();
                          final path = '${tempDir.path}/myfile.jpg';


                          Directory directory1 = await getApplicationDocumentsDirectory();
                          String path1 = directory1.path+'/my_image.png';
                          File f = File(path1);
                          //f.writeAsBytes(imagefile);
                        }
                      }
                    } catch (e) {
                      print(e); //show error
                    }
                  },
                  icon: Icon(Icons.camera),
                  label: Text("Capture"),
                ),

                Container( //show captured image
                  padding: EdgeInsets.all(30),
                  child: image == null?
                  Text("No image captured"):
                  Image.file(File(image!.path), height: 300,),
                  //display captured image
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FarmerDemandFConsent(widget.year, widget.status, widget.date, widget.district, widget.block, widget.village, widget.farmer, widget.aadhar
                            , widget.phone, widget.gender, widget.farmerdemand, widget.FarmerDemandMap,widget.FarmerDemandMapFruits,null, ""),

                        settings: RouteSettings(
                          arguments: image,
                        ),
                          // Pass the automatically generated path to
                          // the DisplayPictureScreen widget.
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

              ]
          )
      ),])

    );
  }

  static Future<bool> saveImage(List<int> imageBytes) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String base64Image = base64Encode(imageBytes);
    return prefs.setString("image", base64Image);
  }

  static Future<Image> getImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Uint8List bytes = base64Decode(prefs.getString("image").toString());
    return Image.memory(bytes);
  }

  Future<PickedFile?> _loadImage1(ImageSource imageSource) async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? file = await imagePicker.getImage(source: imageSource);

    return file;
  }

  Future<File?> _saveImageToDisk(Map map, Directory directory) async {
    print("errrrrinside_function");
    try {
      String path = map['path'];
      Directory directory = map['directory'];
      File tempFile = File(path);
      Img.Image? image = Img.decodeImage(tempFile.readAsBytesSync());
      Img.Image mImage = Img.copyResize(image!, width: 512);
      String imgType = path.split('.').last;
      String mPath =
          '${directory.path.toString()}/image_${widget.aadhar}_${widget.date}.$imgType';
      File dFile = File(mPath);
      if (imgType == 'jpg' || imgType == 'jpeg') {
        dFile.writeAsBytesSync(Img.encodeJpg(mImage));
        print("succcc");
      } else {
        dFile.writeAsBytesSync(Img.encodePng(mImage));
        print("succccc1");
      }
      return dFile;
    } catch (e) {
      print("errrrrr"+e.toString());
      return null;
    }
  }

}



