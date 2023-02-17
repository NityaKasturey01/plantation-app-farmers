import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:plantationapp/screens/data_sync.dart';
import 'package:plantationapp/screens/farmer_plantation.dart';
import 'package:plantationapp/screens/farmer_reg.dart';
//import 'package:plantationapp/screens/farmer_reg3.dart';
import 'package:signature/signature.dart';
//import 'package:plantationapp/screens/farmer_reg2.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class FarmerDistributionSConsent extends StatefulWidget {


  String farmerName;
  Map<String, dynamic> FarmerDemand1;

  FarmerDistributionSConsent(this.farmerName, this.FarmerDemand1);

  @override
  State<FarmerDistributionSConsent> createState() => _FarmerDistributionSConsentState();
}

class _FarmerDistributionSConsentState extends State<FarmerDistributionSConsent> {

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  DateTime _selected = DateTime.now();

  final TextEditingController yearController = new TextEditingController();
  final TextEditingController farmerName = new TextEditingController();
  final TextEditingController demandController = new TextEditingController();
  final TextEditingController treeController = new TextEditingController();

  late Box box3;


  @override
  void initState() {
    createBox();
    print("on map");
    print(widget.FarmerDemand1["farmer_image"]);
    print(widget.FarmerDemand1["farmer_sign"]);
    print(widget.FarmerDemand1["fid"]);
    print("done");
    // print(widget.FarmerDemand1['block']);
    // print("consent3"+widget.FarmerDemand1['year'].toString());
    farmerName.text=widget.farmerName;
    demandController.text=widget.FarmerDemand1['agreement'];
    // demandController.text=widget.FarmerDemand1['farmer_demand'];
    // String remove = widget.FarmerDemand1['farmer_demand_map'].toString().replaceAll("{", "");
    // String remove1 = remove.replaceAll("}", "");
    // treeController.text=remove1;
    // widget.FarmerDemand1["farmer_demand_map"] = remove1;
    // print("consent678"+remove1);
    // widget.FarmerDemand1["aadhar"] = widget.FarmerDemand1['aadhar'].toString().replaceAll("/", "");
    // print(widget.FarmerDemandMap.keys);
    // for (var key in widget.FarmerDemandMap.keys){
    //   treeController.text = treeController.text+", "+key+ ": "+widget.FarmerDemandMap[key];
    // }

    //treeController.text=widget.FarmerDemandMap.keys.elementAt(0);
  }

  void createBox()async{
    box3 = await Hive.openBox('demanddata');
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

    widget.FarmerDemand1['surveyor_signature'] = data;

    showDialog(
      context: context,
      builder: (BuildContext context) => _buildPopupDialogforSignSuccess(context),
    );

  }

  //final String url = "https:/stand4land.in";
  String url = 'https://stand4land.in/plantation_app/add_data_farmer_reg.php';
  final String unencodedPath = "/plantation_app/admin_login.php";
  final Map<String, String> headers = {'Content-Type': 'application/json; charset=UTF-8'};


  Future<http.Response> makePostRequest(String url, String unencodedPath , Map<String, String> header, Map<String,String> requestBody) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    print(response.body);

    if(response.body=='success'){
      print("succ");
      //rint(items1.length);
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(context),
      );

    }
    return response;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 254, 236, 1),
        body: Container(
            padding: EdgeInsets.all(50),
            child: Form(
                child: ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                          children: [
                            SizedBox(height: 40,),
                            Text(
                              "Surveyor’s Consent - Distribution",
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
                            Row(
                              children: [
                                Container(
                                    child: widget.FarmerDemand1['farmer_image'] == null ? new Container() : new Container(
                                      child: Image.file(File(widget.FarmerDemand1['farmer_image']!.path)),
                                      height: 180,
                                      alignment: Alignment.center,
                                    )
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  width: 140,
                                  color: Colors.grey[300],
                                  child: Image.memory(widget.FarmerDemand1['farmer_sign']),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            SizedBox(height: 15,),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 40,),
                                    Container(
                                      child: Text(
                                        "Farmer Name",
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
                                        child: TextFormField(
                                          controller: farmerName,
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: Colors.black54,
                                                letterSpacing: .2,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        )
                                    ),


                                    SizedBox(height: 20,),
                                    Container(
                                      child: Text(
                                        "Farmer's Demand Agreement",
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
                                        child: TextFormField(
                                          controller: demandController,
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: Colors.black54,
                                                letterSpacing: .2,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        )
                                    ),

                                    SizedBox(height: 20,),
                                    Container(
                                      child: Text(
                                        "Surveyor's Signature",
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
                                            color: Colors.blue,
                                            onPressed: (){
                                              _controller.clear();
                                            }, icon: Icon(
                                            Icons.clear,
                                          ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 1),
                                          alignment: Alignment.center,
                                          child: IconButton(
                                            color: Colors.blue,
                                            onPressed: (){
                                              //_controller.clear();
                                              exportImage(context);
                                            }, icon: Icon(
                                            Icons.done_all_outlined,
                                          ),
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.center,
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      padding: EdgeInsets.symmetric(vertical: 25.0),
                                      width: double.infinity,    //sign
                                      child: RaisedButton(
                                        elevation: 1.0,
                                        onPressed: (){
                                          if(widget.FarmerDemand1["surveyor_signature"].toString()=="null"){
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) => _buildPopupDialogforSign(context),
                                            );
                                          } else if (widget.FarmerDemand1["surveyor_signature"].toString()!="null"){
                                            String datetime = DateTime.now().toString();
                                            print(datetime);


                                            String base64Image = base64Encode(File(widget.FarmerDemand1['farmer_image'].path).readAsBytesSync());
                                            widget.FarmerDemand1["farmer_image_base64"] = base64Image;
                                            widget.FarmerDemand1["farmer_image_file_name"] = widget.FarmerDemand1['farmer_image'].path.split("/").last;
                                            widget.FarmerDemand1.remove("farmer_image");
                                            widget.FarmerDemand1['status']="Visit 2: Distribution";

                                            box3.put(datetime, widget.FarmerDemand1);
                                            print("values inside");
                                            print(box3.length);
                                            print(box3.values.length);
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                                                DataSyncDemand(widget.FarmerDemand1),
                                            ),);
                                            print(box3.length);
                                          }
                                          // url = 'https://stand4land.in/plantation_app/add_data_farmer_reg.php';
                                          //
                                          // Map<String,String> body = {};
                                          // print("date"+widget.date);
                                          //
                                          // url = url+"?year="+widget.year+"&status="+widget.status;
                                          // url = url+"&date="+widget.date +"&district="+widget.district
                                          //     +"&block="+widget.block
                                          //     +"&village="+widget.village
                                          //     +"&farmer="+widget.farmer
                                          //     +"&aadhar="+widget.aadhar
                                          //     +"&phone="+widget.phone
                                          //     +"&gender="+widget.gender;
                                          //
                                          //
                                          // print("URL"+url);
                                          // makePostRequest(url, unencodedPath, headers, body);
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => DataSyncDemand(widget.FarmerDemand1),),);
                                        },
                                        padding: EdgeInsets.all(15.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        color: Color.fromRGBO(243, 214, 139, 1.0),
                                        child: Text(
                                          'SUBMIT',
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
                                  ],
                                ))])]))));
  }

  Widget _buildPopupDialogforSign(BuildContext context) {
    return new AlertDialog(
      title: const Text("Surveyor Sign has not been uploaded", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Center(child:
        Text("Take the signature of Yours and check right to the sign for successfully signature uploading"),)

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

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Data Sent Sucessfully', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Center(child:
        Text("Demand of Farmer ${widget.farmerName} has been successfuly registered"),)

        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerRegistration(
                "", "", "", ["Select Block"], ["Select Village"], ["Select District"], widget.FarmerDemand1['userID']
            ),),);
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),

        ),
      ],
    );
  }

  Widget _buildPopupDialogforSignSuccess(BuildContext context) {
    return new AlertDialog(
      title: const Text("Surveyor Sign sucessfully Stored", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Center(child:
        Text("Surveyor sign has been successfully capstured and stored"),)

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

}