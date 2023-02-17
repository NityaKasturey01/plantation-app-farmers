import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:plantationapp/screens/farmer_reg.dart';
import 'package:plantationapp/screens/homescreen.dart';
import 'package:plantationapp/screens/surveyor_consent.dart';

class DataSyncDemand extends StatefulWidget {
  //const DataSyncDemand({Key? key}) : super(key: key);

  Map<String, dynamic> FarmerDemand1;

  DataSyncDemand(this.FarmerDemand1);

  @override
  State<DataSyncDemand> createState() => _DataSyncDemandState();
}

class _DataSyncDemandState extends State<DataSyncDemand> {

  String dropdownvalue1 = 'Select District';
  var items1 = [
    'Select District'
  ];

  String villageNameValue = 'Select Village';
  var itemsVillage = [
    'Select Village'
  ];

  String blockNameValue = 'Select Block';
  var itemsBlock = [
    'Select Block'
  ];

  String farmerNameValue = 'Select Farmer';
  var itemsFarmer = [
    'Select Farmer'
  ];

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 254, 236, 1),
        body: Container(
          padding: EdgeInsets.all(50),
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text(
            "Data Sync to Cloud",
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
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(vertical: 25.0),
            width: double.infinity,
            child: RaisedButton(

              elevation: 1.0,
              onPressed: ()  {
                //startUpload();

                _uploadFarmerImage();


                // makePostRequest0(urlDis, unencodedPath1, headers1);
                // makePostRequest1(urlBlock, unencodedPath1, headers1);
                // makePostRequest2(urlVillage, unencodedPath1, headers1);
                // makePostRequest3(urlFarmer, unencodedPath1, headers1);
                // makePostRequest4(urlAadhar, unencodedPath1, headers1);
                // makePostRequest5(urlDemand, unencodedPath1, headers1);
                // makePostRequest6(urlDistribution, unencodedPath1, headers1);
                // makePostRequest7(urlPlantation, unencodedPath1, headers1);
                // makePostRequest8(urlFollowUp1, unencodedPath1, headers1);
                // makePostRequest9(urlFollowUp2, unencodedPath1, headers1);
                //_uploadFarmerReg();

                showDialog(
                              context: context,
                              builder: (BuildContext context) => _buildPopupDialog(context),
                            );

                setState(() {
                  _isLoading = true;
                });


              },
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.black54,
              child: Text(
                'SYNC DATA',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
          // SizedBox(height: 30,),
          // Container(
          //   margin: EdgeInsets.only(top: 10),
          //   padding: EdgeInsets.symmetric(vertical: 25.0),
          //   width: double.infinity,
          //   child: RaisedButton(
          //
          //     elevation: 1.0,
          //     onPressed: ()  {
          //       Navigator.of(context).pop();
          //       Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(builder: (BuildContext context) => FarmerDemandSConsent(widget.FarmerDemand1['year'],
          //             widget.FarmerDemand1['status'], widget.FarmerDemand1['date'], widget.FarmerDemand1['district'], widget.FarmerDemand1['block'], widget.FarmerDemand1['village'], widget.FarmerDemand1['farmer'], widget.FarmerDemand1['aadhar'], widget.FarmerDemand1['phone'], widget.FarmerDemand1['gender'], widget.FarmerDemand1['farmer_demand'], widget.FarmerDemand1['farmer_demand_map'], widget.FarmerDemand1['image_farmer'], widget.FarmerDemand1['userID'])),
          //       );
          //
          //     },
          //     padding: EdgeInsets.all(15.0),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //     color: Colors.black54,
          //     child: Text(
          //       'EDIT DATA',
          //       style: TextStyle(
          //         color: Colors.white,
          //         letterSpacing: 1.5,
          //         fontSize: 15.0,
          //         fontWeight: FontWeight.w600,
          //         fontFamily: 'OpenSans',
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 0,),
          Container(
            margin: EdgeInsets.only(top: 0),
            padding: EdgeInsets.symmetric(vertical: 25.0),
            width: double.infinity,
            child: RaisedButton(

              elevation: 1.0,
              onPressed: ()  {
                //Navigator.of(context).pop();
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (BuildContext context) => FarmerRegistration(blockNameValue, villageNameValue, dropdownvalue1,
                //     itemsBlock, itemsVillage, items1, widget.FarmerDemand1['userID'])),
                // );


                print(box3.length);
                print("values inside the box");
                print(box3.values);
                for (var i = 0; i < box3.length-1; i++) {
                  print(box3.getAt(i));
                  print("index: " + i.toString());
                  print(box3.getAt(i)['status'].toString());
                  print(box3.getAt(i)['tree_type'].toString());
                  print(box3.getAt(i)['selected_tree'].toString());
                  print(box3.getAt(i)['qty'].toString());
                  box3.getAt(i).forEach((index, element) {
                    print("----");
                    print(index);
                    print(element);
                  });
                }

                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
                UserType(blockNameValue, villageNameValue, dropdownvalue1,
                         itemsBlock, itemsVillage, items1, box1.get('email'))));

              },
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.black54,
              child: Text(
                'Back to Home',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  late Box box3;
  late Box box1;
  late Box boxSynced;

  @override
  void initState() {
    createBox();
    print(widget.FarmerDemand1['block']);
    print("inside iniit of sync");
    print(widget.FarmerDemand1.toString());
  }

  void createBox()async{
    box3 = await Hive.openBox('demanddata');
    box1 = await Hive.openBox('logindata');
    box2 = await Hive.openBox('dropdowndata');
    boxSynced = await Hive.openBox('datasynced');
    print(box3.length);

  }


  //final String url = "https:/stand4land.in";
  String url = 'https://stand4land.in/plantation_app/store_image.php';
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



  startUpload() {
    print('Uploading Image...');
    if (null == widget.FarmerDemand1['farmer_image']) {
      print("error");
      return;
    }
    String fileName = widget.FarmerDemand1['farmer_image'].path.split('/').last;
    upload(fileName);
  }

  upload(String fileName) {
    String uploadEndPoint1 = 'https://stand4land.in/plantation_app/store_image.php';

    Map<String,String> body = {};

    //url = url+"?image="+File(widget.FarmerDemand1['farmer_image']!.path)+"&name="+fileName;
    // url = url+"&date="+widget.date +"&district="+widget.district
    //     +"&block="+widget.block
    //     +"&village="+widget.village
    //     +"&farmer="+widget.farmer
    //     +"&aadhar="+widget.aadhar
    //     +"&phone="+widget.phone
    //     +"&gender="+widget.gender;


    print("URL"+url);
    makePostRequest(url, unencodedPath, headers, body);

    var uploadEndPoint = 'http://localhost/flutter_test/upload_image.php';
  }

  Future<String?> uploadImage1(filename, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('picture', filename));
    var res = await request.send();
    return res.reasonPhrase;
  }


  var districtDID = [];
  var blockDID = [];
  var blockBID = [];
  var villageBID = [];
  var villageVID = [];
  var farmerFID = [];
  var farmerVID = [];
  var farmerAadhar = [];
  var regFID = [];
  var regYear = [];
  var regAD = [];
  var regPhone = [];
  var regGender = [];

  var demandFID = [];
  var demandYear = [];
  var demandUserID = [];
  var demandFarmer = [];
  var demandList = [];
  var demandqty = [];

  var distributionFID = [];
  var distributionUserID = [];
  var distributionPhone = [];
  var distributionAadhar = [];
  var distributionGender = [];
  var distributionYear = [];


  var plantationFID = [];
  var plantationUserID = [];
  var plantationPhone = [];
  var plantationAadhar = [];
  var plantationGender = [];
  var plantationYear = [];

  var fu1FID = [];
  var fu1UserID = [];
  var fu1Phone = [];
  var fu1Aadhar = [];
  var fu1Gender = [];
  var fu1Year = [];

  var fu2FID = [];
  var fu2UserID = [];
  var fu2Phone = [];
  var fu2Aadhar = [];
  var fu2Gender = [];
  var fu2Year = [];

  var ConFID = [];
  var ConUserID = [];
  var ConPhone = [];
  var ConAadhar = [];
  var ConGender = [];
  var ConYear = [];

  late Box box2;


  String urlDis = 'https://stand4land.in/plantation_app/get_district_data.php';
  //final String unencodedPath = "/plantation_app/get_district_data.php";
  final String unencodedPath1 = "/plantation_app/get_block_data.php";
  final Map<String, String> headers1 = {'Content-Type': 'application/json; charset=UTF-8'};
  String urlBlock = 'https://stand4land.in/plantation_app/get_block_data.php';
  String urlVillage = 'https://stand4land.in/plantation_app/get_village_data.php';
  String urlFarmer = 'https://stand4land.in/plantation_app/get_farmer_data.php';
  String urlAadhar = 'https://stand4land.in/plantation_app/get_aadhar_data.php';
  String urlDemand = 'https://stand4land.in/plantation_app/get_demand_data.php';
  String urlDistribution = 'https://stand4land.in/plantation_app/get_distribution_data.php';
  String urlPlantation = 'https://stand4land.in/plantation_app/get_plantation.php';
  String urlFollowUp1 = 'https://stand4land.in/plantation_app/get_followup1.php';
  String urlFollowUp2 = 'https://stand4land.in/plantation_app/get_followup2.php';


  Future<http.Response> makePostRequest0(String url, String unencodedPath , Map<String, String> header) async {
    print("make post request 2");
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    print(response.body);
    var jsonResult = jsonDecode(response.body);
    if(response.statusCode==200){
      jsonResult.forEach((s)=> items1.add(s["dname"]));
      jsonResult.forEach((s)=> districtDID.add(s["did"]));
      print("this inside box code");
      print(box2.get("district1"));
      print("helo");
      print(items1);
      box2.put('district1', items1);
      box2.put('districtDID', districtDID);
      print(box2.get("district1"));
      print("innonononon ------> ");
      box2.get("district1").forEach((element) { print(element); });
    }
    // print("items"+items1.length.toString());
    // items1.clear();
    // print("items1"+items1.length.toString());

    //items1.add(d1);
    print("box hivvee");
    print(items1);
    //dropdownvalue1=response.body;
    print("innonononon12 ------> ");
    box2.get("district1").forEach((element) { print(element); });
    return response;
  }

  Future<http.Response> makePostRequest1(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    print(response.body);
    var jsonResult = jsonDecode(response.body);
    print(jsonResult.length);
    if(response.statusCode==200){
      jsonResult.forEach((s)=> itemsBlock.add(s["bname"]));
      jsonResult.forEach((s)=> blockDID.add(s["did"]));
      jsonResult.forEach((s)=> blockBID.add(s["bid"]));
      print("box hivve");
      print(itemsBlock);
      box2.put('block1', itemsBlock);
      box2.put('blockDID', blockDID);
      box2.put('blockBID', blockBID);
    }
    //items1.add(d1);
    //jsonResult.forEach((s)=> itemsBlock.add(s["bname"]));
    //print(itemsBlock);
    //dropdownvalue1=response.body;
    return response;
  }

  Future<http.Response> makePostRequest2(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var jsonResult = jsonDecode(response.body);
      print(jsonResult.length);
      //items1.add(d1);
      jsonResult.forEach((s)=> itemsVillage.add(s["vname"]));
      jsonResult.forEach((s)=> villageVID.add(s["vid"]));
      jsonResult.forEach((s)=> villageBID.add(s["bid"]));
      box2.put("village1",itemsVillage);
      box2.put('villageBID', villageBID);
      box2.put('villageVID', villageVID);
      print("Village Box 1234");
      box2.get("villageBID").forEach((s)=> print(s));
    }
    //dropdownvalue1=response.body;
    return response;
  }


  Future<List<String>> makePostRequest3(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var jsonResult = jsonDecode(response.body);
      print(jsonResult.length);
      //items1.add(d1);
      jsonResult.forEach((s)=> itemsFarmer.add(s["fname"]));
      jsonResult.forEach((s)=> print(s["bid"]));
      jsonResult.forEach((s)=> farmerVID.add(s["vid"]));
      jsonResult.forEach((s)=> farmerFID.add(s["fid"]));
      box2.put("farmer1",itemsFarmer);
      box2.put('farmerVID', farmerVID);
      box2.put('farmerFID', farmerFID);
      print("Farmer Box 1234");
      box2.get("farmerFID").forEach((s)=> print(s));
    }
    return itemsFarmer;
  }


  Future<http.Response> makePostRequest4(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print("Farmer Box 1234566");
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var jsonResult = jsonDecode(response.body);
      print(jsonResult.length);
      jsonResult.forEach((s){
        regYear.add(s["year"]);
        regFID.add(s["fid"]);
        regAD.add(s["aadhar"]);
        regPhone.add(s["phone"]);
        regGender.add(s["gender"]);
      });
      box2.put("regYear",regYear);
      box2.put("regFID",regFID);
      box2.put('regAD', regAD);
      box2.put('regPhone', regPhone);
      box2.put('regGender', regGender);
      print("Farmer Box 1234566");
      box2.get("regPhone").forEach((s)=> print(s));
    }
    return response;
  }

  Future<http.Response> makePostRequest5(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print("Farmer Box 1234577");
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var jsonResult = jsonDecode(response.body);
      print(jsonResult.length);
      jsonResult.forEach((s){
        demandYear.add(s["year"]);
        demandFID.add(s["fid"]);
        demandUserID.add(s["emp_id"]);
        demandFarmer.add(s["tree_type"]);
        demandList.add(s["selected_tree"]);
        demandqty.add(s["qty"]);
      });
      box2.put("demandYear",demandYear);
      box2.put("demandFID",demandFID);
      box2.put('demandUserID', demandUserID);
      box2.put('demandFarmer', demandFarmer);
      box2.put('demandList', demandList);
      box2.put('demandqty', demandqty);
      print("Farmer Box 1234566");
      box2.get("demandFID").forEach((s)=> print(s));
    }
    return response;
  }

  Future<http.Response> makePostRequest6(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print("Farmer Box 1234588");
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var jsonResult = jsonDecode(response.body);
      print(jsonResult.length);
      jsonResult.forEach((s){
        distributionGender.add(s["gender"]);
        distributionAadhar.add(s["ad"]);
        distributionPhone.add(s["phone"]);
        distributionYear.add(s["year"]);
        distributionFID.add(s["aadhar"]);
        distributionUserID.add(s["emp_id"]);
      });
      box2.put("distributionGender",distributionGender);
      box2.put("distributionAd",distributionAadhar);
      box2.put("distributionPhone",distributionPhone);
      box2.put("distributionYear",distributionYear);
      box2.put("distributionFID",distributionFID);
      box2.put('distributionUserID', distributionUserID);
      print("Farmer Box 1234566");
      box2.get("distributionFID").forEach((s)=> print(s));
    }
    return response;
  }

  Future<http.Response> makePostRequest7(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print("Farmer Box 123458812345678");
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){

      print("opopopopop");
      print(response.body);
      if(response.body != "0 results"){
        var jsonResult = jsonDecode(response.body);
        print(jsonResult.length);
        jsonResult.forEach((s){
          plantationGender.add(s["gender"]);
          plantationAadhar.add(s["ad"]);
          plantationPhone.add(s["phone"]);
          plantationYear.add(s["year"]);
          plantationFID.add(s["aadhar"]);
          plantationUserID.add(s["emp_id"]);
        });
        box2.put("plantationGender",plantationGender);
        box2.put("plantationAd",plantationAadhar);
        box2.put("plantationPhone",plantationPhone);
        box2.put("plantationYear",plantationYear);
        box2.put("plantationFID",plantationFID);
        box2.put('plantationUserID', plantationUserID);
        print("Farmer Box 1234566");
        box2.get("plantationFID").forEach((s)=> print(s));
      }
    }
    return response;
  }

  Future<http.Response> makePostRequest8(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print("Farmer Box 1234588");
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var jsonResult = jsonDecode(response.body);
      print(jsonResult.length);
      jsonResult.forEach((s){
        fu1Gender.add(s["gender"]);
        fu1Aadhar.add(s["ad"]);
        fu1Phone.add(s["phone"]);
        fu1Year.add(s["year"]);
        fu1FID.add(s["aadhar"]);
        fu1UserID.add(s["emp_id"]);
      });
      box2.put("fu1Gender",fu1Gender);
      box2.put("fu1Ad",fu1Aadhar);
      box2.put("fu1Phone",fu1Phone);
      box2.put("fu1Year",fu1Year);
      box2.put("fu1FID",fu1FID);
      box2.put('fu1UserID', fu1UserID);
      print("Farmer Box 1234566");
      box2.get("fu1FID").forEach((s)=> print(s));
    }
    return response;
  }

  Future<http.Response> makePostRequest9(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print("Farmer Box 1234588");
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var jsonResult = jsonDecode(response.body);
      print(jsonResult.length);
      jsonResult.forEach((s){
        fu2Gender.add(s["gender"]);
        fu2Aadhar.add(s["ad"]);
        fu2Phone.add(s["phone"]);
        fu2Year.add(s["year"]);
        fu2FID.add(s["aadhar"]);
        fu2UserID.add(s["emp_id"]);
      });
      box2.put("fu2Gender",fu2Gender);
      box2.put("fu2Ad",fu2Aadhar);
      box2.put("fu2Phone",fu2Phone);
      box2.put("fu2Year",fu2Year);
      box2.put("fu2FID",fu2FID);
      box2.put('fu2UserID', fu2UserID);
      print("Farmer Box 1234566");
      box2.get("fu2FID").forEach((s)=> print(s));
    }
    return response;
  }

  Future<http.Response> makePostRequest15(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print("Farmer Box 1234588");
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var jsonResult = jsonDecode(response.body);
      print(jsonResult.length);
      jsonResult.forEach((s){
        ConGender.add(s["gender"]);
        ConAadhar.add(s["ad"]);
        ConPhone.add(s["phone"]);
        ConYear.add(s["year"]);
        ConFID.add(s["aadhar"]);
        ConUserID.add(s["emp_id"]);
      });
      box2.put("ConGender",ConGender);
      box2.put("ConAd",ConAadhar);
      box2.put("ConPhone",ConPhone);
      box2.put("ConYear",ConYear);
      box2.put("ConFID",ConFID);
      box2.put('ConUserID', ConUserID);
      print("Farmer Box 1234566");
      box2.get("ConFID").forEach((s)=> print(s));
    }
    return response;
  }


  final String phpEndPoint = 'https://stand4land.in/plantation_app/store_image.php';
  final String phpEndPoint2 = 'https://stand4land.in/plantation_app/store_distribution.php';
  final String phpEndPoint3 = 'https://stand4land.in/plantation_app/store_plantation.php';
  final String phpEndPoint4 = 'https://stand4land.in/plantation_app/store_followup1.php';
  final String phpEndPoint5 = 'https://stand4land.in/plantation_app/store_followup2.php';
  final String phpEndPoint6 = 'https://stand4land.in/plantation_app/store_conclusion.php';

  void _uploadFarmerImage() {


    print(box3.length);
    print("values inside the box");
    print(box3.values);
    for (var i = 0; i < box3.length-1; i++) {
      print(box3.getAt(i));
      print("index: "+ i.toString());
      print(box3.getAt(i)['status'].toString());

      print(box3.getAt(i).toString());

      if(box3.getAt(i)['status']=='Visit 1: Demand'){
        //String base64Image = base64Encode(File(widget.FarmerDemand1['farmer_image'].path).readAsBytesSync());
        String fileName = box3.getAt(i)['farmer']+"_"+box1.get('email')+".jpg";

        if (box3.getAt(i)['farmer_signature'] == null) return;
        var _image = MemoryImage(box3.getAt(i)['farmer_signature']);
        String base64ImageFarmer_Sign = base64Encode(box3.getAt(i)['farmer_signature']);
        String fileNameFarmer_Sign = box3.getAt(i)['aadhar']+"_"+box3.getAt(i)['phone'].split("/").last;

        if (box3.getAt(i)['surveyor_signature'] == null) return;
        String base64ImageSurveyor_Sign = base64Encode(box3.getAt(i)['surveyor_signature']);
        String fileNameSurveyor_Sign = box3.getAt(i)['aadhar'].split("/").last;

        print("Data to be sent surveyor");
        print(fileNameSurveyor_Sign.toString());
        print(base64ImageSurveyor_Sign.toString());

        http.post(Uri.parse(phpEndPoint), body: {
          "year": box3.getAt(i)['year'],
          "image_farmer": box3.getAt(i)['farmer_image_base64'],
          "name_image_farmer": box3.getAt(i)['farmer_image_file_name'],
          "image_farmer_sign": base64ImageFarmer_Sign,
          "name_farmer_sign": fileNameFarmer_Sign,
          "image_surveyor_sign": base64ImageSurveyor_Sign,
          "name_surveyor_sign": fileNameSurveyor_Sign,
          "userID": box1.get('email'),
          "aadhar": box3.getAt(i)['aadhar'],
          "fid": box3.getAt(i)['fid'],
          "farmer_demand": box3.getAt(i)['farmer_demand'],
          "farmer_demand_map": box3.getAt(i)['farmer_demand_map'].toString(),

        }).then((res) {
          print("inside data");
          print(res.statusCode);
          print(res.body);

          if(i == box3.length-2){
            setState(() {
              _isLoading = false;

            });

            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialogChecked(context),
            );

          }
          print("isloading"+_isLoading.toString());
        }).catchError((err) {
          print(err);
        });


        http.post(Uri.parse(phpEndPoint1), body: {
          "year": box3.getAt(i)['year'],
          "status": box3.getAt(i)['status'],
          "date": box3.getAt(i)['date'],
          "district": box3.getAt(i)['district'],
          "block": box3.getAt(i)['block'],
          "village": box3.getAt(i)['village'],
          "farmer": box3.getAt(i)['farmer'],
          "aadhar": box3.getAt(i)['aadhar'],
          "phone": box3.getAt(i)['phone'],
          "gender": box3.getAt(i)['gender'],
          "fid": box3.getAt(i)['fid'],
        }).then((res) {
          print(res.statusCode);
          print(res.body);
          if(res.body=="success"){
            print("consent success");

            print("isloading"+_isLoading.toString());

            // if(i == box3.length-1){
            //
            //   // showDialog(
            //   //   context: context,
            //   //   builder: (BuildContext context) => _buildPopupDialogChecked(context),
            //   // );
            //
            // }

            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
            //return 1;
          }
          else if(res.body!="success"){
            //return 0;
          }
        }).catchError((err) {
          print(err);
        });
      }
      else if(box3.getAt(i)['status']=='Visit 2: Distribution'){
        print("VariousDtru");
        print(box3.getAt(i)['farmer_sign']);
        print(box3.getAt(i)['surveyor_signature']);

        if (box3.getAt(i)['farmer_sign'] == null) return;
        var _image = MemoryImage(box3.getAt(i)['farmer_sign']);
        String base64ImageFarmer_Sign = base64Encode(box3.getAt(i)['farmer_sign']);
        String fileNameFarmer_Sign = box3.getAt(i)['fid'].toString()+"_"+box1.get('email').split("/").last;

        if (box3.getAt(i)['surveyor_signature'] == null) return;
        String base64ImageSurveyor_Sign = base64Encode(box3.getAt(i)['surveyor_signature']);
        String fileNameSurveyor_Sign = box3.getAt(i)['fid'].toString().split("/").last;

        print("Data to be sent surveyor");
        print(fileNameSurveyor_Sign.toString());
        print(base64ImageSurveyor_Sign.toString());

        print("VALUES --- ");
        print(box3.getAt(i)['farmer_image_base64']);
        print(box3.getAt(i)['farmer_image_file_name']);
        print(base64ImageFarmer_Sign);
        print(fileNameFarmer_Sign);
        print(base64ImageSurveyor_Sign);
        print(fileNameSurveyor_Sign);
        print(box1.get('email'));
        print(box3.getAt(i)['fid']);
        print(box3.getAt(i)['agreement']);
        print(box3.get("yearSel").toString());

        http.post(Uri.parse(phpEndPoint2), body: {
          "year": box3.get("yearSel").toString(),
          "image_farmer": box3.getAt(i)['farmer_image_base64'],
          "name_image_farmer": box3.getAt(i)['farmer_image_file_name'],
          "image_farmer_sign": base64ImageFarmer_Sign,
          "name_farmer_sign": fileNameFarmer_Sign,
          "image_surveyor_sign": base64ImageSurveyor_Sign,
          "name_surveyor_sign": fileNameSurveyor_Sign,
          "userID": box1.get('email'),
          "fid": box3.getAt(i)['fid'].toString(),
          "agreement": box3.getAt(i)['agreement'],

        }).then((res) {
          print("inside data");
          print(res.statusCode);
          print(res.body);

          if(i == box3.length-2){
            setState(() {
              _isLoading = false;
            });

            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialogChecked(context),
            );

          }
          print("isloading"+_isLoading.toString());
        }).catchError((err) {
          print(err);
        });
      }
      else if(box3.getAt(i)['status']=='Visit 3: Plantation'){
        print("Various");
        print(box3.getAt(i)['farmer_sign']);
        print(box3.getAt(i)['surveyor_signature']);

        if (box3.getAt(i)['farmer_sign'] == null) return;
        var _image = MemoryImage(box3.getAt(i)['farmer_sign']);
        String base64ImageFarmer_Sign = base64Encode(box3.getAt(i)['farmer_sign']);
        String fileNameFarmer_Sign = box3.getAt(i)['fid'].toString()+"_"+box1.get('email').split("/").last;

        if (box3.getAt(i)['surveyor_signature'] == null) return;
        String base64ImageSurveyor_Sign = base64Encode(box3.getAt(i)['surveyor_signature']);
        String fileNameSurveyor_Sign = box3.getAt(i)['fid'].toString().split("/").last;

        print("Data to be sent surveyor");
        print(fileNameSurveyor_Sign.toString());
        print(base64ImageSurveyor_Sign.toString());

        print("VALUES --- ");
        print(box3.getAt(i)['farmer_image_base64']);
        print(box3.getAt(i)['farmer_image_file_name']);
        print(base64ImageFarmer_Sign);
        print(fileNameFarmer_Sign);
        print(base64ImageSurveyor_Sign);
        print(fileNameSurveyor_Sign);
        print(box1.get('email'));
        print(box3.getAt(i)['fid']);
        print(box3.getAt(i)['agreement']);


        print("Final Values to be stored");
        print(box1.get('email'));
        print(box3.getAt(i)['fid'].toString());
        print(box3.getAt(i)['tree_type']);
        print(box3.getAt(i)['selected_tree']);
        print(box3.getAt(i)['qty']);
        print(box3.getAt(i)['farmer_image_base64']);
        print(box3.getAt(i)['farmer_image_file_name']);
        print(box3.getAt(i)['base64ImageFarmer_Sign']);
        print(box3.getAt(i)['fileNameFarmer_Sign']);
        print(box3.getAt(i)['base64ImageSurveyor_Sign']);
        print(box3.getAt(i)['fileNameSurveyor_Sign']);
        print(box3.getAt(i)['selected_tree'].length.toString());

        for(var j = 0; j < box3.getAt(i)['selected_tree'].length; j++) {
          print("length"+j.toString());
          print("length: " + box3.getAt(i)['selected_tree'].length.toString());
          http.post(Uri.parse(phpEndPoint3), body: {
            "year": box3.get("yearSel").toString(),
            "image_farmer": box3.getAt(i)['farmer_image_base64'][j],
            "name_image_farmer": box3.getAt(i)['farmer_image_file_name'][j],
            "image_farmer_sign": base64ImageFarmer_Sign,
            "name_farmer_sign": fileNameFarmer_Sign,
            "image_surveyor_sign": base64ImageSurveyor_Sign,
            "name_surveyor_sign": fileNameSurveyor_Sign,
            "userID": box1.get('email'),
            "fid": box3.getAt(i)['fid'].toString(),
            "tree_type": box3.getAt(i)['tree_type'][j],
            "selected_tree": box3.getAt(i)['selected_tree'][j],
            "qty": box3.getAt(i)['qty'][j],

          }).then((res) {
            print("inside data");
            print(res.statusCode);
            print(res.body);

            print(_isLoading);

            print("HELOOO");
            print(i);
            print(box3.length - 2);
            if (i == box3.length - 2) {
              setState(() {
                _isLoading = false;
              });

              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    _buildPopupDialogChecked(context),
              );

            print("isloading" + _isLoading.toString());
          }}).catchError((err) {
            print(err);
          });
        }
      }
      else if(box3.getAt(i)['status']=='Visit 4: FollowUp1'){
        print("Various");
        print(box3.getAt(i)['farmer_sign']);
        print(box3.getAt(i)['surveyor_signature']);

        if (box3.getAt(i)['farmer_sign'] == null) return;
        var _image = MemoryImage(box3.getAt(i)['farmer_sign']);
        String base64ImageFarmer_Sign = base64Encode(box3.getAt(i)['farmer_sign']);
        String fileNameFarmer_Sign = box3.getAt(i)['fid'].toString()+"_"+box1.get('email').split("/").last;

        if (box3.getAt(i)['surveyor_signature'] == null) return;
        String base64ImageSurveyor_Sign = base64Encode(box3.getAt(i)['surveyor_signature']);
        String fileNameSurveyor_Sign = box3.getAt(i)['fid'].toString().split("/").last;

        print("Data to be sent surveyor");
        print(fileNameSurveyor_Sign.toString());
        print(base64ImageSurveyor_Sign.toString());

        print("VALUES --- ");
        print(box3.getAt(i)['farmer_image_base64']);
        print(box3.getAt(i)['farmer_image_file_name']);
        print(base64ImageFarmer_Sign);
        print(fileNameFarmer_Sign);
        print(base64ImageSurveyor_Sign);
        print(fileNameSurveyor_Sign);
        print(box1.get('email'));
        print(box3.getAt(i)['fid']);
        print(box3.getAt(i)['agreement']);


        print("Final Values to be stored");
        print(box1.get('email'));
        print(box3.getAt(i)['fid'].toString());
        print(box3.getAt(i)['tree_type']);
        print(box3.getAt(i)['selected_tree']);
        print(box3.getAt(i)['qty']);
        print(box3.getAt(i)['farmer_image_base64']);
        print(box3.getAt(i)['farmer_image_file_name']);
        print(box3.getAt(i)['base64ImageFarmer_Sign']);
        print(box3.getAt(i)['fileNameFarmer_Sign']);
        print(box3.getAt(i)['base64ImageSurveyor_Sign']);
        print(box3.getAt(i)['fileNameSurveyor_Sign']);

        for(var j = 0; j < box3.getAt(i)['selected_tree'].length; j++) {
          print("length"+j.toString());
          print("length: " + box3.getAt(i)['selected_tree'].length.toString());
          http.post(Uri.parse(phpEndPoint4), body: {
            "year": box3.get("yearSel").toString(),
            "image_farmer": box3.getAt(i)['farmer_image_base64'][j],
            "name_image_farmer": box3.getAt(i)['farmer_image_file_name'][j],
            "image_farmer_sign": base64ImageFarmer_Sign,
            "name_farmer_sign": fileNameFarmer_Sign,
            "image_surveyor_sign": base64ImageSurveyor_Sign,
            "name_surveyor_sign": fileNameSurveyor_Sign,
            "userID": box1.get('email'),
            "fid": box3.getAt(i)['fid'].toString(),
            "tree_type": "plant/tree",
            "selected_tree": box3.getAt(i)['selected_tree'][j].toString(),
            "qty": box3.getAt(i)['qty'][j].toString(),

          }).then((res) {
            print("inside data");
            print(res.statusCode);
            print(res.body);

            if (i == box3.length - 2) {
              if(j == box3.getAt(i)['selected_tree'].length-1){
                setState(() {
                  _isLoading = false;
                });

                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildPopupDialogChecked(context),
                );
              }
              print("isloading" + _isLoading.toString());
            }}).catchError((err) {
            print(err);
          });
        }
      }
      else if(box3.getAt(i)['status']=='Visit 5: FollowUp2'){
        print("Various");
        print(box3.getAt(i)['farmer_sign']);
        print(box3.getAt(i)['surveyor_signature']);

        if (box3.getAt(i)['farmer_sign'] == null) return;
        var _image = MemoryImage(box3.getAt(i)['farmer_sign']);
        String base64ImageFarmer_Sign = base64Encode(box3.getAt(i)['farmer_sign']);
        String fileNameFarmer_Sign = box3.getAt(i)['fid'].toString()+"_"+box1.get('email').split("/").last;

        if (box3.getAt(i)['surveyor_signature'] == null) return;
        String base64ImageSurveyor_Sign = base64Encode(box3.getAt(i)['surveyor_signature']);
        String fileNameSurveyor_Sign = box3.getAt(i)['fid'].toString().split("/").last;

        print("Data to be sent surveyor");
        print(fileNameSurveyor_Sign.toString());
        print(base64ImageSurveyor_Sign.toString());

        print("VALUES --- ");
        print(box3.getAt(i)['farmer_image_base64']);
        print(box3.getAt(i)['farmer_image_file_name']);
        print(base64ImageFarmer_Sign);
        print(fileNameFarmer_Sign);
        print(base64ImageSurveyor_Sign);
        print(fileNameSurveyor_Sign);
        print(box1.get('email'));
        print(box3.getAt(i)['fid']);
        print(box3.getAt(i)['agreement']);


        print("Final Values to be stored");
        print(box1.get('email'));
        print(box3.getAt(i)['fid'].toString());
        print(box3.getAt(i)['tree_type']);
        print(box3.getAt(i)['selected_tree']);
        print(box3.getAt(i)['qty']);
        print(box3.getAt(i)['farmer_image_base64']);
        print(box3.getAt(i)['farmer_image_file_name']);
        print(box3.getAt(i)['base64ImageFarmer_Sign']);
        print(box3.getAt(i)['fileNameFarmer_Sign']);
        print(box3.getAt(i)['base64ImageSurveyor_Sign']);
        print(box3.getAt(i)['fileNameSurveyor_Sign']);

        for(var j = 0; j < box3.getAt(i)['selected_tree'].length; j++) {
          print("length"+j.toString());
          print("length: " + box3.getAt(i)['selected_tree'].length.toString());
          http.post(Uri.parse(phpEndPoint5), body: {
            "year": box3.get("yearSel").toString(),
            "image_farmer": box3.getAt(i)['farmer_image_base64'][j],
            "name_image_farmer": box3.getAt(i)['farmer_image_file_name'][j],
            "image_farmer_sign": base64ImageFarmer_Sign,
            "name_farmer_sign": fileNameFarmer_Sign,
            "image_surveyor_sign": base64ImageSurveyor_Sign,
            "name_surveyor_sign": fileNameSurveyor_Sign,
            "userID": box1.get('email'),
            "fid": box3.getAt(i)['fid'].toString(),
            "tree_type": "plant/tree",
            "selected_tree": box3.getAt(i)['selected_tree'][j].toString(),
            "qty": box3.getAt(i)['qty'][j].toString(),

          }).then((res) {
            print("inside data");
            print(res.statusCode);
            print(res.body);

            if (i == box3.length - 2) {

                setState(() {
                  _isLoading = false;
                });

                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildPopupDialogChecked(context),
                );

              print("isloading" + _isLoading.toString());
            }}).catchError((err) {
            print(err);
          });
        }
      }
      else if(box3.getAt(i)['status']=='Conclusion'){
        print("Various");
        print(box3.getAt(i)['farmer_sign']);
        print(box3.getAt(i)['surveyor_signature']);

        if (box3.getAt(i)['farmer_sign'] == null) return;
        var _image = MemoryImage(box3.getAt(i)['farmer_sign']);
        String base64ImageFarmer_Sign = base64Encode(box3.getAt(i)['farmer_sign']);
        String fileNameFarmer_Sign = box3.getAt(i)['fid'].toString()+"_"+box1.get('email').split("/").last;

        if (box3.getAt(i)['surveyor_signature'] == null) return;
        String base64ImageSurveyor_Sign = base64Encode(box3.getAt(i)['surveyor_signature']);
        String fileNameSurveyor_Sign = box3.getAt(i)['fid'].toString().split("/").last;

        print("Data to be sent surveyor");
        print(fileNameSurveyor_Sign.toString());
        print(base64ImageSurveyor_Sign.toString());

        print("VALUES --- ");
        print(box3.getAt(i)['farmer_image_base64']);
        print(box3.getAt(i)['farmer_image_file_name']);
        print(base64ImageFarmer_Sign);
        print(fileNameFarmer_Sign);
        print(base64ImageSurveyor_Sign);
        print(fileNameSurveyor_Sign);
        print(box1.get('email'));
        print(box3.getAt(i)['fid']);
        print(box3.getAt(i)['agreement']);


        print("Final Values to be stored");
        print(box1.get('email'));
        print(box3.getAt(i)['fid'].toString());
        print(box3.getAt(i)['tree_type']);
        print(box3.getAt(i)['selected_tree']);
        print(box3.getAt(i)['qty']);
        print(box3.getAt(i)['farmer_image_base64']);
        print(box3.getAt(i)['farmer_image_file_name']);
        print(box3.getAt(i)['base64ImageFarmer_Sign']);
        print(box3.getAt(i)['fileNameFarmer_Sign']);
        print(box3.getAt(i)['base64ImageSurveyor_Sign']);
        print(box3.getAt(i)['fileNameSurveyor_Sign']);

        for(var j = 0; j < box3.getAt(i)['selected_tree'].length; j++) {
          print("length"+j.toString());
          print("length: " + box3.getAt(i)['selected_tree'].length.toString());
          http.post(Uri.parse(phpEndPoint6), body: {
            "image_farmer_sign": base64ImageFarmer_Sign,
            "name_farmer_sign": fileNameFarmer_Sign,
            "image_surveyor_sign": base64ImageSurveyor_Sign,
            "name_surveyor_sign": fileNameSurveyor_Sign,
            "userID": box1.get('email'),
            "fid": box3.getAt(i)['fid'].toString(),
            "tree_type": "plant/tree",
            "selected_tree": box3.getAt(i)['selected_tree'][j].toString(),
            "qty": box3.getAt(i)['qty'][j].toString(),

          }).then((res) {
            print("inside data");
            print(res.statusCode);
            print(res.body);

            if (i == box3.length - 1) {
              if(j == box3.getAt(i)['selected_tree'].length-1){
                setState(() {
                  _isLoading = false;
                });

                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildPopupDialogChecked(context),
                );
              }
              print("isloading" + _isLoading.toString());
            }}).catchError((err) {
            print(err);
          });
        }
      }


    }

    setState(() {
      _isLoading = false;
    });
  }

  final String phpEndPoint1 = 'https://stand4land.in/plantation_app/store_farmer_reg.php';

   void _uploadFarmerReg() {
     print("Data coming 12345");
     print(widget.FarmerDemand1['district']);

    // http.post(Uri.parse(phpEndPoint1), body: {
    //   "year": widget.FarmerDemand1['year'],
    //   "status": widget.FarmerDemand1['status'],
    //   "date": widget.FarmerDemand1['date'],
    //   "district": widget.FarmerDemand1['district'],
    //   "block": widget.FarmerDemand1['block'],
    //   "village": widget.FarmerDemand1['village'],
    //   "farmer": widget.FarmerDemand1['farmer'],
    //   "aadhar": widget.FarmerDemand1['aadhar'],
    //   "phone": widget.FarmerDemand1['phone'],
    //   "gender": widget.FarmerDemand1['gender'],
    //   "fid": widget.FarmerDemand1['fid'],
    // }).then((res) {
    //   print(res.statusCode);
    //   print(res.body);
    //   if(res.body=="success"){
    //     print("consent success");
    //     showDialog(
    //           context: context,
    //           builder: (BuildContext context) => _buildPopupDialog(context),
    //         );
    //     //return 1;
    //   }
    //   else if(res.body!="success"){
    //     //return 0;
    //   }
    // }).catchError((err) {
    //   print(err);
    // });
   //_buildPopupDialog1(context);

  }

  Future<void> _uploadFarmerSign() async {

    if (widget.FarmerDemand1['farmer_signature'] == null) return;
    // File f1 = await File('my_image.jpg').writeAsBytes(widget.FarmerDemand1['farmer_signature']);
    // String base64Image = base64Encode(f1.readAsBytesSync());
    var _image = MemoryImage(widget.FarmerDemand1['farmer_signature']);
    String base64Image = base64Encode(widget.FarmerDemand1['farmer_signature']);
    String fileName = widget.FarmerDemand1['aadhar']+"_"+widget.FarmerDemand1['phone'].split("/").last;

    http.post(Uri.parse(phpEndPoint), body: {
      "image": base64Image,
      "name": fileName,
      "aadhar": widget.FarmerDemand1['aadhar'],
    }).then((res) {
      print(res.statusCode);
      print(res.body);
      if(res.body=="success"){
        _buildPopupDialog(context);
      }
    }).catchError((err) {
      print(err);
    });
  }

  void _uploadSurveyorSign() {
    if (widget.FarmerDemand1['surveyor_signature'] == null) return;
    String base64Image = base64Encode(widget.FarmerDemand1['surveyor_signature']);
    String fileName = widget.FarmerDemand1['aadhar'].split("/").last;

    http.post(Uri.parse(phpEndPoint), body: {
      "image": base64Image,
      "name": fileName,
      "aadhar": widget.FarmerDemand1['aadhar'],
    }).then((res) {
      print(res.statusCode);
    }).catchError((err) {
      print(err);
    });
  }

  Widget _buildPopupDialog(BuildContext context) {
     print("_isLoading1"+_isLoading.toString());
    return new AlertDialog(

      title: const Text('Data Sending to the Server', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Center(child:
            Container(
          child: CircularProgressIndicator(),
              height: 100,
              width: 100,
      ),)

        ],
      ),
      // actions: <Widget>[
      //   new FlatButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //       // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
      //       //     FarmerRegistration(blockNameValue, villageNameValue, dropdownvalue1,
      //       //         itemsBlock, itemsVillage, items1, "widget.FarmerDemand1['userID']")),
      //       //         (Route<dynamic> route) => false);
      //     },
      //     textColor: Theme.of(context).primaryColor,
      //     child: const Text('Close'),
      //
      //   ),
      // ],
    );
  }


  Widget _buildPopupDialogChecked(BuildContext context) {
    print("_isLoading1"+_isLoading.toString());







    return new AlertDialog(

      title: const Text('Data Sent Sucessfully', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Center(child:
        Text("Demand of Farmers has been successfuly registered"),)

        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {

            //boxSynced = box3;
            print(box3.values);



            var mappedValues = box3.values.map((m) => m).toList();


            if(boxSynced.get("box3").toString()!=null.toString()){
              for(int i=0;i<boxSynced.get("box3").length-1;i++){
                print(boxSynced.get("box3")[i]);
                mappedValues.add(boxSynced.get("box3")[i]);
              }
            }
            print(boxSynced.get("box3"));

            //mappedValues.add(boxSynced.get("box3"));
            print(mappedValues);
            print(mappedValues.length);

            // for(int i=0;i<mappedValues.length-1;i++){
            //   print(mappedValues[i]);
            //   print(mappedValues[i]['status']);
            //   print(mappedValues[i]['year']);
            //   print(mappedValues[i]['farmer']);
            //   print(mappedValues[i]['village']);
            //   print(mappedValues[i]['farmer_demand_map']);
            //
            // }


            box2.clear();

            print("GETTT");
            makePostRequest0(urlDis, unencodedPath1, headers1);
            makePostRequest1(urlBlock, unencodedPath1, headers1);
            makePostRequest2(urlVillage, unencodedPath1, headers1);
            makePostRequest3(urlFarmer, unencodedPath1, headers1);
            makePostRequest4(urlAadhar, unencodedPath1, headers1);
            makePostRequest5(urlDemand, unencodedPath1, headers1);
            makePostRequest6(urlDistribution, unencodedPath1, headers1);
            makePostRequest7(urlPlantation, unencodedPath1, headers1);
            makePostRequest8(urlFollowUp1, unencodedPath1, headers1);
            makePostRequest9(urlFollowUp2, unencodedPath1, headers1);

            boxSynced.put("box3", mappedValues);

            print(boxSynced.get("box3"));

            //print(box3.get("district1").toString());
            box3.clear();


            Navigator.of(context).pop();

            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                UserType(blockNameValue, villageNameValue, dropdownvalue1,
                    itemsBlock, itemsVillage, items1, box1.get('email'))),
                    (Route<dynamic> route) => false);
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),

        ),
      ],
    );
  }

  Widget _buildPopupDialog1(BuildContext context) {
    return new CircularProgressIndicator();
  }

  String urlDis1 = 'https://stand4land.in/plantation_app/get_district_data.php';
  //final String unencodedPath = "/plantation_app/get_district_data.php";
  final String unencodedPath11 = "/plantation_app/get_block_data.php";
  final Map<String, String> headers11 = {'Content-Type': 'application/json; charset=UTF-8'};
  String urlBlock1 = 'https://stand4land.in/plantation_app/get_block_data.php';
  String urlVillage1 = 'https://stand4land.in/plantation_app/get_village_data.php';
  String urlFarmer1 = 'https://stand4land.in/plantation_app/get_farmer_data.php';


  Future<http.Response> makePostRequest01(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    print(response.body);
    var jsonResult = jsonDecode(response.body);
    // print("items"+items1.length.toString());
    // items1.clear();
    // print("items1"+items1.length.toString());

    //items1.add(d1);
    jsonResult.forEach((s)=> items1.add(s["dname"]));
    print("this");
    print(items1);
    //dropdownvalue1=response.body;
    return response;
  }

  Future<http.Response> makePostRequest11(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    
    print(response.body);
    var jsonResult = jsonDecode(response.body);
    print(jsonResult.length);
    //items1.add(d1);
    jsonResult.forEach((s)=> itemsBlock.add(s["bname"]));
    print(itemsBlock);
    //dropdownvalue1=response.body;
    return response;
  }

  Future<http.Response> makePostRequest21(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    print(response.body);
    var jsonResult = jsonDecode(response.body);
    print(jsonResult.length);
    //items1.add(d1);
    jsonResult.forEach((s)=> itemsVillage.add(s["vname"]));
    //dropdownvalue1=response.body;
    return response;
  }

}
