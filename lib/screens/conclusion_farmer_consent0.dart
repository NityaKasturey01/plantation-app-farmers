
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plantationapp/screens/farmer_plantation_surveyor_consent.dart';
import 'package:plantationapp/screens/login_screen.dart';
import 'package:plantationapp/screens/surveyor_consent.dart';
import 'package:plantationapp/screens/take_picture_from_camera2.dart';
import 'package:plantationapp/screens/take_picture_page.dart';
import 'package:signature/signature.dart';

import 'conclusion_farmer_consent.dart';
import 'farmer_distribution_Surveyor_consent.dart';
import 'follow_up_1_surveyor_cons.dart';

class FarmerConclusionFConsent extends StatefulWidget {
  //const FarmerDemandFConsent({Key? key}) : super(key: key)

  String farmerName, farmerChecked;
  int fid;
  List tree_type, selected_tree, qty, treeImage;
  var imageFarmer;

  FarmerConclusionFConsent(this.farmerName, this.farmerChecked, this.fid,
      this.tree_type, this.selected_tree, this.qty, this.imageFarmer, this.treeImage);

  @override
  State<FarmerConclusionFConsent> createState() => _FarmerConclusionFConsentState();
}

class _FarmerConclusionFConsentState extends State<FarmerConclusionFConsent> {

  late final todo;
  var image1 = null;
  var image11 = null;

  Map<String, dynamic> FarmerData1 = {
    'farmer_image': '',
    'agreement': '',
    'farmer_sign': '',
    'surveyor_sign': '',
    'fid': '',
    'emp_id': '',
  };

  Box? box1;

  List treeImage = [];

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  @override
  void initState() {
    createBox();
    print("Email: ");
    print(box1?.get("email"));


    print("not map");
    print("done");
    super.initState();
    _controller.addListener(() => print('Value changed'));
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final cameras = await availableCameras();
      print(cameras);
      // setState(() {});
      controller = CameraController(cameras[0], ResolutionPreset.medium);
      controller.initialize().then((value) => {
        setState(() {
          _isInited = true;
        })
      });
    });
    FarmerData1['agreement'] = widget.farmerChecked;
    FarmerData1['fid'] = widget.fid;
    FarmerData1['farmer_image'] = widget.treeImage;
    FarmerData1['tree_type'] = widget.tree_type;
    FarmerData1['selected_tree'] = widget.selected_tree;
    FarmerData1['qty'] = widget.qty;

    print("values of ninini");
    print(widget.selected_tree);



    // widget.selected_tree.asMap().forEach((index, element) {
    //   treeImage.insert(index, null);
    // });
    // store multiple images for each type of tree
    // data sync
    //send to cloud
    //same for follow up1 and 2
    //conclusion

    //print("consent1"+FarmerData1['year']);
    //chooseImage('')
  }

  void createBox()async{
    box1 = await Hive.openBox('logindata');
    print("Email1: ");
    print(box1?.get("email"));
  }

  late CameraDescription camera;
  late CameraController controller;
  bool _isInited = false;
  late String _url;
  String _path = "";

  late PickedFile uploadImage;
  late File? selected = null;

  Future<void> chooseImage(ImageSource imageSource) async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? file = await imagePicker.getImage(source: imageSource);
    //set source: ImageSource.camera to get image from camera
    setState((){
      uploadImage = file!;
      selected = File(uploadImage.path);
    });
  }



  Future<void> exportImage(BuildContext context) async {
    if (_controller.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No content')));
      return;
    }

    final Uint8List? data = await _controller.toPngBytes();

    if (data == null) {
      return;
    }

    FarmerData1['farmer_sign'] = data;


    // await Navigator.of(context).push(
    //   MaterialPageRoute<void>(
    //     builder: (BuildContext context) {
    //       return Scaffold(
    //         appBar: AppBar(),
    //         body: Center(
    //           child: Container(
    //             color: Colors.grey[300],
    //             child: Image.memory(data),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }



  Widget _buildPopupDialog(BuildContext context, var image12) {
    return new AlertDialog(
      title: const Text('Farmer Image successfully Captured', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child:
            Image.file(File(image12!.path))
            ,
            height: 180, alignment: Alignment.center,)
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (BuildContext context) => FarmerConclusionFConsent(widget.farmerName, widget.farmerChecked, widget.fid, widget.tree_type, widget.selected_tree, widget.qty, image12, widget.treeImage)),
            );
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 254, 236, 1),
        body: SingleChildScrollView(child: Container(
          padding: EdgeInsets.all(50),
          child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                    children: [
                      SizedBox(height: 40,),
                      Text(
                        "Farmer's Consent - Conclusion",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Color.fromRGBO(120, 153, 50, 1),
                              letterSpacing: .2,
                              fontSize: 24,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SizedBox(height: 20,),
                              Container(
                                child: Text(
                                  "Selected Tree",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color.fromRGBO(58, 58, 58, 1),
                                        letterSpacing: .2,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                padding: EdgeInsets.only(left: 5),
                              ),

                              ListView(shrinkWrap: true, children: [Container(
                                  child: Expanded(child: Column(
                                    children: [
                                      Scrollbar(child:
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: widget.selected_tree.length,
                                          itemBuilder: (context,index){
                                            return GestureDetector(
                                                onTap: (){
                                                  setState(() async {
                                                    image1 = await ImagePicker().getImage(source:ImageSource.camera);
                                                    if(image1 == null){
                                                      print("succc"+image1);
                                                      return;}

                                                    GallerySaver.saveImage(image1.path);
                                                    print("correct"+image1.path);
                                                    FarmerData1['farmer_image']=image1.path;
                                                    //treeImage[index] = image1.path;
                                                    // treeImage.insert(index, image1.path);
                                                    widget.treeImage[index]=image1.path;
                                                    image11 = image1;
                                                    print("succccc"+image11.path);
                                                    image11 = image1;
                                                    print("succcc"+image11.path);

                                                    //_onLoading();
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) => _buildPopupDialog(context,image11),
                                                    );
                                                  });

                                                },
                                                child: _buildPopupDialogCard(context, widget.selected_tree[index], widget.qty[index].toString(), index));
                                          }))
                                    ],
                                  ),)
                              ),]),
                              //
                              // SizedBox(height: 20,),
                              // Container(
                              //   child: Text(
                              //     "Select/Click Photo",
                              //     textAlign: TextAlign.left,
                              //     style: GoogleFonts.poppins(
                              //       textStyle: TextStyle(
                              //           color: Color.fromRGBO(58, 58, 58, 1),
                              //           letterSpacing: .2,
                              //           fontSize: 15,
                              //           fontWeight: FontWeight.w600
                              //       ),
                              //     ),
                              //   ),
                              //   padding: EdgeInsets.only(left: 5),
                              // ),
                              // Container(
                              //     child: widget.imageFarmer == null ? new Container() : new Container(
                              //       child: Image.file(File(widget.imageFarmer!.path)),
                              //       height: 180,
                              //       alignment: Alignment.center,
                              //     )
                              // ),
                              // Container(
                              //   margin: EdgeInsets.only(top: 10),
                              //   padding: EdgeInsets.symmetric(vertical: 25.0),
                              //   width: double.infinity,
                              //   child: RaisedButton(
                              //     elevation: 1.0,
                              //     onPressed: () {
                              //       //_showCamera();
                              //
                              //
                              //
                              //       setState(() async {
                              //         image1 = await ImagePicker().getImage(source:ImageSource.camera);
                              //         if(image1 == null){
                              //           print("succc"+image1);
                              //           return;}
                              //
                              //         GallerySaver.saveImage(image1.path);
                              //         print("correct"+image1.path);
                              //         FarmerData1['farmer_image']=image1.path;
                              //         image11 = image1;
                              //         print("succccc"+image11.path);
                              //         image11 = image1;
                              //         print("succcc"+image11.path);
                              //
                              //         // Navigator.pushAndRemoveUntil(
                              //         //   context,
                              //         //   MaterialPageRoute(builder: (context) => FarmerDemandFConsent(widget.year,
                              //         //       widget.status, widget.date, widget.district, widget.block, widget.village, widget.farmer, widget.aadhar, widget.phone, widget.gender, widget.farmerdemand, widget.FarmerDemandMap)), // this mainpage is your page to refresh
                              //         //       (Route<dynamic> route) => false,
                              //         // );
                              //
                              //         // Navigator.push(
                              //         //   context,
                              //         //   MaterialPageRoute(builder: (BuildContext context) => FarmerDemandFConsent(widget.year,
                              //         //   widget.status, widget.date, widget.district, widget.block, widget.village, widget.farmer, widget.aadhar, widget.phone, widget.gender, widget.farmerdemand, widget.FarmerDemandMap)),
                              //         // );
                              //
                              //
                              //
                              //         //_onLoading();
                              //         showDialog(
                              //           context: context,
                              //           builder: (BuildContext context) => _buildPopupDialog(context,image11),
                              //         );
                              //       });
                              //
                              //
                              //
                              //
                              //       //Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerRegistration3(),),);
                              //     },
                              //     padding: EdgeInsets.all(15.0),
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(10.0),
                              //     ),
                              //     color: Color.fromRGBO(255, 252, 177, 1.0),
                              //     child: Text(
                              //       'Capture',
                              //       style: TextStyle(
                              //         color: Color.fromRGBO(93, 43, 14, 1),
                              //         letterSpacing: 1.5,
                              //         fontSize: 15.0,
                              //         fontWeight: FontWeight.w600,
                              //         fontFamily: 'OpenSans',
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              SizedBox(height: 20,),
                              Container(
                                child: Text(
                                  "Farmers's Signature",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color.fromRGBO(58, 58, 58, 1),
                                        letterSpacing: .2,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                padding: EdgeInsets.only(left: 5),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                                decoration: BoxDecoration(
                                    color:Color.fromRGBO(215, 222, 199, 1.0),
                                    border: Border.all(
                                        color: Color.fromRGBO(215, 222, 199, 1.0)
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                margin: EdgeInsets.only(top: 1),
                                child: Signature(
                                  controller: _controller,
                                  height: 130,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 6, top: 4, right: 6, bottom: 2),
                                    margin: EdgeInsets.only(top: 1),
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      icon: const Icon(Icons.redo),
                                      color: Colors.blue,
                                      onPressed: () {
                                        setState(() => _controller.clear());
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 1),
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      icon: const Icon(Icons.check_circle_rounded),
                                      color: Colors.blue,
                                      onPressed: () => exportImage(context),
                                    ),
                                  ),

                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              )
                            ]
                        ),
                      ),
                    ]
                ),
                // Container(
                //   child: Image.file(File(todo!.path), height: 300,),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 1.0,
                    onPressed: (){
                      //print("consentf "+FarmerData1['year']);
                      print("hey"+FarmerData1["farmer_image"].toString());
                      print("heee"+FarmerData1["farmer_sign"].toString());

                      if(FarmerData1["farmer_image"].toString()==""){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupDialogforCam(context),
                        );
                      }else if(FarmerData1["farmer_sign"].toString()==""){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupDialogforSign(context),
                        );
                      }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerConclusionSConsent(
                            widget.farmerName, FarmerData1
                        ),),);
                      }

                    },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color.fromRGBO(243, 214, 139, 1.0),
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Color.fromRGBO(93, 43, 14, 1),
                        letterSpacing: 1.5,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
              ]),
        ))
    );}

  Widget _buildPopupDialogforCam(BuildContext context) {
    return new AlertDialog(
      title: const Text("Farmer photo is not selected or captured", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Center(child:
        Text("Capture farmer's photo from capture option"),)

        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildPopupDialogforSign(BuildContext context) {
    return new AlertDialog(
      title: const Text("Farmer Sign has not been uploaded", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Center(child:
        Text("Take the signature from farmer and check right to the sign for successfully signature uploading"),)

        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildPopupDialogCard(BuildContext context, String selectedT, String QTY, int index) {
    print("farmer"+widget.imageFarmer.toString());
    print(index);
    print(widget.treeImage);
    print(widget.treeImage.asMap()[index] == null);
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        color: Color.fromRGBO(251, 190, 37, 0.6),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            visualDensity: VisualDensity(vertical: 2),
            title: Padding(
              padding: const EdgeInsets.all(2),
              child: Text(selectedT,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18)),
            ),
            subtitle: Padding(padding: EdgeInsets.all(1),
                child: Text("Quantity: "+QTY,style: TextStyle(color: Colors.indigo.shade500, fontWeight: FontWeight.bold,fontSize: 15))),
          ),
        ),
      ),
    );
  }
}


class Todo {
  final XFile image;
  const Todo(this.image);
}