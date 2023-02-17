//import 'package:flutter/cupertino.dart';


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:plantationapp/screens/farmer_reg.dart';
import 'package:http/http.dart' as http;

import 'homescreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);



  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isChecked = false;
  late Box box1;
  late Box box2;

  String dropdownvalue1 = 'Select District';
  var items1 = [
    'Select District'
  ];
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

  var demandYear = [];
  var demandFID = [];
  var demandUserID = [];
  var demandFarmer = [];
  var demandList = [];
  var demandqty = [];

  var distributionFID = [];
  var distributionPhone = [];
  var distributionAadhar = [];
  var distributionGender = [];
  var distributionYear = [];
  var distributionUserID = [];

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


  bool _passwordVisible = true;
  TextEditingController controllerUserID = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  @override
  void initState() {
    createBox();
    _passwordVisible = true;
    print("inside inint 1st"+items1.length.toString());
    items1.clear();
    items1.add("Select District");
    controllerUserID.clear();
    controllerPass.clear();
    print("inside inint"+items1.length.toString());
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
  }

  //final String url = "https:/stand4land.in";
  String url = 'https://stand4land.in/plantation_app/surveyor_login.php';
  final String unencodedPath = "/plantation_app/admin_login.php";
  final Map<String, String> headers = {'Content-Type': 'application/json; charset=UTF-8'};


  void createBox()async{
    box1 = await Hive.openBox('logindata');
    getdata();
    box2 = await Hive.openBox('dropdowndata');
    box2.clear();
  }
  void getdata()async{
    if(box1.get('email')!=null){
      controllerUserID.text = box1.get('email');
      isChecked = true;
      setState(() {
      });
    }
    if(box1.get('pass')!=null){
      controllerPass.text = box1.get('pass');
      isChecked = true;
      setState(() {
      });
    }
  }


  Future<http.Response> makePostRequest(String url, String unencodedPath , Map<String, String> header, Map<String,String> requestBody) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    print(response.body);

    if(response.body=='success'){

      box2.clear();
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


      if(isChecked){
        box1.put('email', controllerUserID.value.text);
        box1.put('pass', controllerPass.value.text);
      }
      box1.put('email', controllerUserID.value.text);
      box1.put('pass', controllerPass.value.text);
      box1.put('isLogged',true);

      print("box val abcd1");
      //box2.get("district1").forEach((element) { print(element); });
      print("Block Box 1234");
      //box2.get("block1").forEach((s)=> print(s));
      print("login_time");
      print(box1.get("email"));
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FarmerRegistration(
      //     blockNameValue, villageNameValue, dropdownvalue1, itemsBlock, itemsVillage, items1, controllerUserID.text
      // ),),);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserType(
          blockNameValue, villageNameValue, dropdownvalue1, itemsBlock, itemsVillage, items1, controllerUserID.text
      ),),);

    }
    else{
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(context),
      );
    }
    return response;
  }


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
        print(s['year']);
        regYear.add(s["year"]);
        regFID.add(s["fid"]);
        regAD.add(s["aadhar"]);
        regPhone.add(s["phone"]);
        regGender.add(s["gender"]);
      });
      box2.put("regYear",regYear);
      print(box2.get("regYear").toString());
      box2.put("regFID",regFID);
      box2.put('regAD', regAD);
      box2.put('regPhone', regPhone);
      box2.put('regGender', regGender);
      print("Farmer Box 123456612");
      box2.get("regYear").forEach((s)=> print("hey"+s.toString()));
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
      box2.put("distributionFID",distributionFID);
      box2.put("distributionYear",distributionYear);
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
    print("Farmer Box 1234588");
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
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




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 231, 169, 1),
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView(
            shrinkWrap: true,
            children: [
              Column(
          children: [
            Image.asset("assets/images/logo1.png", width: 200),
            SizedBox(height: 40,),
            Text(
              "LOGIN",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.black87,
                    letterSpacing: .2,
                    fontSize: 29,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

                Container(
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                          "User ID",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(134, 56, 48, 1),
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
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(width: 1, color: Colors.lightBlue.shade900),
                                top: BorderSide(width: 1, color: Colors.lightBlue.shade900),
                                right: BorderSide(width: 1, color: Colors.lightBlue.shade900),
                                left: BorderSide(width: 1, color: Colors.lightBlue.shade900),
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          margin: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: controllerUserID,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              //contentPadding: EdgeInsets.all(1),
                              hintText: 'Enter your User ID',
                              prefixIcon: Icon(Icons.person_rounded),
                            ),
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.black54,
                                letterSpacing: .2,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          child: Text(
                            "Password",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(134, 56, 48, 1),
                                  letterSpacing: .2,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(left: 5, top: 40),
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(width: 1, color: Colors.lightBlue.shade900),
                                top: BorderSide(width: 1, color: Colors.lightBlue.shade900),
                                right: BorderSide(width: 1, color: Colors.lightBlue.shade900),
                                left: BorderSide(width: 1, color: Colors.lightBlue.shade900),
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          margin: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: controllerPass,
                            obscureText: _passwordVisible,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              //contentPadding: EdgeInsets.all(1),
                              hintText: 'Your Password',
                              prefixIcon: Icon(Icons.key),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    print("instate");
                                    print(_passwordVisible);
                                    _passwordVisible = !_passwordVisible;

                                  });
                                },
                              ),
                            ),
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.black54,
                                letterSpacing: .2,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                          ),
                        ),

                        GestureDetector(child: Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 1.0,
                            onPressed: (){
                              print("in pressed");
                              url = 'https://stand4land.in/plantation_app/surveyor_login.php';

                              Map<String,String> body = {'user_id': controllerUserID.text, 'password': controllerPass.text};

                              url = url+"?user_id="+controllerUserID.text+"&password="+controllerPass.text;
                              print("URL"+url);
                              makePostRequest(url, unencodedPath, headers, body);
                             // Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerRegistration(),),);
                            },
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Color.fromRGBO(243, 214, 139, 1.0),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Color.fromRGBO(93, 43, 14, 1),
                                letterSpacing: 1.5,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ),),

                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ])
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Incorrect User ID or Password', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Center(child:
        Text("Please enter correct User ID or Password"),)

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
