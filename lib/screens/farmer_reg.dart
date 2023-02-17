import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:plantationapp/screens/farmer_demand.dart';
import 'package:plantationapp/screens/farmer_distribution.dart';
import 'package:plantationapp/screens/farmer_plantation.dart';
import 'package:plantationapp/screens/follow_up_1.dart';
import 'package:plantationapp/screens/login_screen.dart';
import 'package:plantationapp/screens/surveyor_consent.dart';
import 'package:http/http.dart' as http;

import 'farmer_conclusion.dart';
import 'follow_up_2.dart';
import 'homescreen.dart';

class FarmerRegistration extends StatefulWidget {
  //const FarmerRegistration({Key? key}) : super(key: key);

  String valueBlock1, valueVillage1, valueDistrict1, userID;
  var  itemsBlock1, itmesVillage1, itemsDIstrict1;



  FarmerRegistration(
      this.valueBlock1,
      this.valueVillage1,
      this.valueDistrict1,
      this.itemsBlock1,
      this.itmesVillage1,
      this.itemsDIstrict1,
      this.userID); // FarmerRegistration(
  //     this.valueFarmer,
  //     this.valueBlock,
  //     this.valueVillage,
  //     this.valueDistrict,
  //     this.itemsFarmer,
  //     this.itemsBlock,
  //     this.itmesVillage,
  //     this.itemsDIstrict);

  @override
  State<FarmerRegistration> createState() => _FarmerRegistrationState();
}

class _FarmerRegistrationState extends State<FarmerRegistration> {

  List data = [];
  String _mySelection="Dang";

  DateTime _selected = DateTime.now();

  final TextEditingController yearController = new TextEditingController();
  final TextEditingController dateController = new TextEditingController();
  final TextEditingController aadharController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  TextEditingController controllerEmpBankName = TextEditingController();

  final formGlobalKey = GlobalKey < FormState > ();
  final formGlobalKey2 = GlobalKey < FormState > ();
  final formGlobalKey3 = GlobalKey < FormState > ();
  final formGlobalKey4 = GlobalKey < FormState > ();
  final formGlobalKey5 = GlobalKey < FormState > ();

  bool _validateYear= false;
  bool _validateAd= false;
  bool _validatePhone= false;
  String adText = "";
  String phText = "";

  DateTime dateToday =new DateTime.now();
  String dateTod = DateTime.now().toString().substring(0,10);


  String dropdownvalue = 'Visit 1: Demand';
  var items = [
    'Visit 1: Demand',
    'Visit 2: Distribution',
    'Visit 3: Plantation',
    'Visit 4: FollowUp1',
    'Visit 5: FollowUp2',
    'Conclusion'
  ];

  String districtdropdownvalue1 = 'Select District';
  var districtitems1 = [
    'Select District'
  ];
  String blockdropdownvalue1 = 'Select Block';
  var blockitems1 = [
    'Select Block'
  ];
  String villagedropdownvalue1 = 'Select Village';
  var villageitems1 = [
    'Select Village'
  ];
  String farmerdropdownvalue1 = 'Select Farmer';
  var farmeritems1 = [
    'Select Farmer'
  ];
  var districtDID1 = [];
  var blockDID1 = [];
  var blockBID1 = [];
  var villageBID1 = [];
  var villageVID1 = [];
  var farmerVID1 = [];
  var farmerFID1 = [];
  int i1 = 0;

  var farmerYear = [];

  String dropdownvalue1 = 'Select District';
  var items1 = [
    'Select District'
  ];
  var items8 = [
    'Select District'
  ];
  var districtID=[];
  var items3 = [];

  String villageNameValue = 'Select Village';
  var itemsVillage = [
    'Select Village'
  ];

  String blockNameValue = 'Select Block';
  var itemsBlock = [
    'Select Block'
  ];
  var blockDID = [];
  var blockID = [];

  String farmerNameValue = 'Select Farmer';
  var itemsFarmer = [
    'Select Farmer'
  ];

  var villageDID = [];
  var villageID = [];

  dynamic d1 = "District";
  dynamic districts = ['District'];

  String dd1 = "Dang";
  List list1=[];
  Map<String, int> map1 = {};

  String dropdownvalue2 = 'Male';
  var items2 = [
    'Male',
    'Female',
    'Others'
  ];

  Box? box1;
  Box? box2;
  Box? box3;
  Box? box4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //districtitems1.clear();
    //OpenBox();
    createBox();
    print("${widget.itemsDIstrict1}");
    print("${widget.itemsBlock1}");
    print("${widget.itmesVillage1}");
    items1.clear();
    dateController.text=dateTod;
    //makePostRequest(url, unencodedPath, headers);
    //makePostRequest1(urlBlock, unencodedPath1, headers);
    //makePostRequest2(urlVillage, unencodedPath, headers);
    //items1=widget.itemsDIstrict1;
    //itemsBlock=widget.itemsBlock1;
    //itemsVillage=widget.itmesVillage1;
    //items3= widget.itemsDIstrict1;
    print(items1.toString());
  }


  void createBox()async{
    box1 = await Hive.openBox('dropdowndata');
    getdata();
    box2 = await Hive.openBox("logindata");
    box3 = await Hive.openBox("farmer_demand");
    box4 = await Hive.openBox("demanddata");
  }
  void getdata()async{
    print("box dataabcd");
    print(box1?.get('block1'));
    if(box1?.get('district1')!=null){
      setState(() {
        print("length123");
        box1?.get("district1").forEach((element) { print(element); });
        print(districtitems1);
        districtitems1.clear();
        districtitems1.forEach((element) { print(element); });
        print("add");
        districtitems1 = box1?.get("district1");
        districtitems1.forEach((element) { print(element); });
        blockitems1.clear();
        blockitems1 = box1?.get("block1");
        print("HEYYYYYYYYYYY");
        print(blockitems1);
        villageitems1.clear();
        villageitems1 = box1?.get("village1");
        farmeritems1.clear();
        farmeritems1 = box1?.get("farmer1");
        //print("length: "+box1?.get("district").toString());
        print("length: "+districtitems1.length.toString());

        districtDID1 = box1?.get("districtDID");
        blockDID1 = box1?.get("blockDID");
        blockBID1 = box1?.get("blockBID");
        villageBID1 = box1?.get("villageBID");
        villageVID1 = box1?.get("villageVID");
        farmerVID1 = box1?.get("farmerVID");
        farmerFID1 = box1?.get("farmerFID");
      });
    }

    districtitems1.forEach((element) { print(element); });
  }


  //final String url = "https:/stand4land.in";
  String url = 'https://stand4land.in/plantation_app/get_district_data.php';
  final String unencodedPath = "/plantation_app/get_district_data.php";
  final String unencodedPath1 = "/plantation_app/get_block_data.php";
  final Map<String, String> headers = {'Content-Type': 'application/json; charset=UTF-8'};
  String urlBlock = 'https://stand4land.in/plantation_app/get_block_data.php';
  String urlVillage = 'https://stand4land.in/plantation_app/get_village_data.php';
  String urlFarmer = 'https://stand4land.in/plantation_app/get_farmer_data.php';

  String urlBlock1 = 'https://stand4land.in/plantation_app/get_block_data_from_did.php';
  String urlVillage1 = 'https://stand4land.in/plantation_app/get_block_data_from_did.php';
  String urlFarmer1 = 'https://stand4land.in/plantation_app/get_farmer_data_from_vid.php';

  Future<List<String>> makePostRequest(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    print(response.body);
    var jsonResult = jsonDecode(response.body);
    print(jsonResult.length);
    d1 = jsonResult[0]['dname'];
    jsonResult.forEach((s)=> districts.add(s["dname"]));
    print(d1);
    print(districts);
    list1.add(d1);
    //items1.add(d1);
    print("values1"+items8.length.toString());
    items8.clear();
    districtID.clear();
    print("values2"+items8.length.toString());
    items8.add("Select District");
    jsonResult.forEach((s)=> items8.add(s["dname"]));
    jsonResult.forEach((s)=> districtID.add(s["did"]));
    print("values3"+items8.length.toString());
    //dropdownvalue1=response.body;
    return items8;
  }

  Future<List<String>> makePostRequest1(String url, String unencodedPath , Map<String, String> header) async {
    print("34 url: "+url);
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    print(response.body);
    var jsonResult = jsonDecode(response.body);
    print(jsonResult.length);
    d1 = jsonResult[0]['bname'];
    itemsBlock.clear();
    itemsBlock.add("Select Block");
    jsonResult.forEach((s)=> districts.add(s["bname"]));
    print(d1);
    print(districts);
    list1.add(d1);
    //items1.add(d1);
    blockID.clear();
    blockDID.clear();
    jsonResult.forEach((s)=>  print("items_block_held"+s["bname"]));
    jsonResult.forEach((s)=> itemsBlock.add(s["bname"]));
    print("itemsin block__"+itemsBlock.toString());
    jsonResult.forEach((s)=> blockDID.add(s["did"]));
    jsonResult.forEach((s)=> blockID.add(s["bid"]));

    //dropdownvalue1=response.body;
    return itemsBlock;
  }

  Future<List<String>> makePostRequest2(String url, String unencodedPath , Map<String, String> header) async {
    print("34 url2: "+url);
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);   //colors: status code and body
    print(response.body);
    if(response.body.toString() == "0 results"){
      itemsVillage.clear();
      itemsVillage.add("Select Village");
      itemsVillage.add("No Village Data Found in selected block. Select Another Block. ");
    } else{
      print("inside else bro");
      var jsonResult = jsonDecode(response.body);
      print(jsonResult.length);
      d1 = jsonResult[0]['vname'];
      itemsVillage.clear();
      itemsVillage.add("Select Village");
      // jsonResult.forEach((s)=> districts.add(s["vname"]));
      // print(d1);
      // print(districts);
      // list1.add(d1);
      // //items1.add(d1);
      // jsonResult.forEach((s)=> itemsVillage.add(s["vname"]));
      villageDID.clear();
      villageID.clear();
      jsonResult.forEach((s)=>  print("items_village_held"+s["vname"].toString()));
      jsonResult.forEach((s)=> itemsVillage.add(s["vname"]));
      print("itemsin village__"+itemsVillage.toString());
      jsonResult.forEach((s)=> villageDID.add(s["bid"]));
      jsonResult.forEach((s)=> villageID.add(s["vid"]));
      print("village_id"+villageID.toString());
      //dropdownvalue1=response.body;
    }

    return itemsVillage;
  }

  Future<List<String>> makePostRequest3(String url, String unencodedPath , Map<String, String> header) async {
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    print(response.body);
    if(response.body.toString() == "0 results"){
      itemsFarmer.clear();
      itemsFarmer.add("Select Farmer");
      itemsFarmer.add("No Farmer Data Found in selected Village. Select Another Village. ");
    } else{
      var jsonResult = jsonDecode(response.body);
      print(jsonResult.length);
      d1 = jsonResult[0]['fname'];
      itemsFarmer.clear();
      itemsFarmer.add("Select Farmer");
      jsonResult.forEach((s)=> districts.add(s["fname"]));
      print(d1);
      print(districts);
      list1.add(d1);
      //items1.add(d1);
      jsonResult.forEach((s)=> itemsFarmer.add(s["fname"]));
      //dropdownvalue1=response.body;
    }
    return itemsFarmer;
  }


  Future<List<String>> makePostRequestforAadhar(String url, String unencodedPath , Map<String, String> header) async {
    print("34 url: "+url);
    final response = await http.get(
      //Uri.http(url,unencodedPath),
      Uri.parse(url),
      headers: header,
    );
    print(response.statusCode);
    print(response.body);
    var jsonResult = jsonDecode(response.body);
    print(jsonResult.length);
    var regFID;
    var regAD;
    var regPhone;
    var regGender;
    jsonResult.forEach((s){
      regFID.add(s["fid"]);
      regAD.add(s["aadhar"]);
      regPhone.add(s["phone"]);
      regGender.add(s["gender"]);
    });
    //dropdownvalue1=response.body;
    return itemsBlock;
  }

  void OpenBox() async{
    box2 = await Hive.openBox('logindata');
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 254, 236, 1),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Form(child: ListView(
          shrinkWrap: true,
          children: [
            Column(
          children: [
            Row(
              children: [
                Text(
                  "Farmer's \nRegistration",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: Color.fromRGBO(120, 153, 50, 1),
                        letterSpacing: .2,
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                IconButton(
              iconSize: 40,
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserType(
                        widget.valueBlock1, widget.valueVillage1, widget.valueDistrict1, widget.itemsBlock1, widget.itmesVillage1, widget.valueDistrict1, widget.userID
                    ),),);
                // print("boxx hello");
                // print(box2?.get("isLogged"));
                // box2?.put('isLogged',false);
                // print("box after");
                // print(box2?.get("isLogged"));
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>LoginScreen()));
              },
            ),


              ],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
            SizedBox(height: 10,),

            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    child: Text(
                      "Status of Visit",
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
                          color:Color.fromRGBO(255, 235, 220, 1),
                          border: Border.all(
                              color: Color.fromRGBO(255, 235, 220, 1)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.only(top: 1),
                      child: DropdownButton(

                        isExpanded: true,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black54,
                              letterSpacing: .2,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),

                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      )
                  ),

                  SizedBox(height: 20,),

                  Container(
                    child: Text(
                      "Year",
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
                          color:Color.fromRGBO(255, 235, 220, 1),
                          border: Border.all(
                              color: Color.fromRGBO(255, 235, 220, 1)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.only(top: 1),
                      child: TextField(
                        onChanged: (value){
                          setState(() {
                            print("insideset state");
                            yearController.text.isEmpty ? _validateYear = true : _validateYear = false;
                          });
                        },
                        readOnly: true,
                        controller: yearController,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //contentPadding: EdgeInsets.all(1),
                          hintText: 'Select year',
                          prefixIcon: Icon(Icons.calendar_month_sharp),
                          errorText: _validateYear ? 'Select Year' : null,
                        ),
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.black54,
                            letterSpacing: .2,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: (){
                          print("object");
                          showDialog(context: context, builder:(BuildContext context) => _buildPopupDialog(context));
                        },
                      ),


                      // child: YearPicker(
                      //   firstDate: DateTime(2018),
                      //   lastDate: DateTime.now(),
                      //   selectedDate: _selected,
                      //   onChanged: (DateTime){
                      //       _selected = DateTime;
                      //   },
                      // )
                  ),
                  //SizedBox(height: 20,),
                  // Container(
                  //   child: Text(
                  //     "Status of Visit",
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
                  //   padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                  //   decoration: BoxDecoration(
                  //       color:Color.fromRGBO(255, 235, 220, 1),
                  //       border: Border.all(
                  //         color: Color.fromRGBO(255, 235, 220, 1)
                  //       ),
                  //       borderRadius: BorderRadius.all(Radius.circular(10))
                  //   ),
                  //   margin: EdgeInsets.only(top: 1),
                  //   child: DropdownButton(
                  //
                  //     isExpanded: true,
                  //     style: GoogleFonts.lato(
                  //       textStyle: TextStyle(
                  //           color: Colors.black54,
                  //           letterSpacing: .2,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w600
                  //       ),
                  //     ),
                  //     value: dropdownvalue,
                  //     icon: const Icon(Icons.keyboard_arrow_down),
                  //     items: items.map((String items) {
                  //       return DropdownMenuItem(
                  //         value: items,
                  //         child: Text(items),
                  //
                  //       );
                  //     }).toList(),
                  //     // After selecting the desired option,it will
                  //     // change button value to selected value
                  //     onChanged: (String? newValue) {
                  //       setState(() {
                  //         dropdownvalue = newValue!;
                  //       });
                  //     },
                  //   )
                  // ),

                  SizedBox(height: 40,),
                  Container(
                    child: Text(
                      "Date",
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
                        color:Color.fromRGBO(181, 231, 77, 0.56),
                        border: Border.all(
                            color: Color.fromRGBO(181, 231, 77, 0.56)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    margin: EdgeInsets.only(top: 1),
                    child: TextField(
                      readOnly: true,
                      controller: dateController,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        //contentPadding: EdgeInsets.all(1),

                        prefixIcon: Icon(Icons.date_range_outlined),
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



                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "District1",
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
                  Form(
                    key: formGlobalKey,
                    child: Container(
                      padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                      decoration: BoxDecoration(
                          color:Color.fromRGBO(181, 231, 77, 0.56),
                          border: Border.all(
                              color: Color.fromRGBO(181, 231, 77, 0.56)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.only(top: 1),
                      child: DropdownButtonFormField(
                        isExpanded: true,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black54,
                              letterSpacing: .2,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        value: districtdropdownvalue1,
                        validator: (value) {
                          if (districtdropdownvalue1 == null || districtdropdownvalue1=="Select District") {
                            return 'Please select';
                          }
                          return null;
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: districtitems1.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          int i1, i3;
                          String i2;
                          List<String> newList=["Select Block"];
                          setState(() {
                            districtdropdownvalue1 = newValue!;
                            blockdropdownvalue1 = "Select Block";
                            villagedropdownvalue1 = "Select Village";
                            farmerdropdownvalue1 = "Select Farmer";
                            aadharController.clear();
                            phoneController.clear();

                            i1 = districtitems1.indexOf(newValue);
                            print("len"+blockitems1.length.toString());
                            print(i1);
                            print(newList);
                            blockDID1.asMap().forEach((index, element) {
                              print(element);
                              print(i1);
                              print("nect");
                              print(newList);
                              print(box1?.get("block1")[index]);
                              if(element.toString() == i1.toString()){
                                print(newList);
                                print("index"+index.toString());
                                print(box1?.get("block1")[index+1]);
                                newList.add(box1?.get("block1")[index+1]);
                              }
                            });
                            print(newList);
                            blockitems1 = newList;
                          });
                          formGlobalKey.currentState!.validate();
                        },
                      )
                  ),),



                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "Block1",
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
                  Form(
                    key: formGlobalKey2,
                    child: Container(
                      padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                      decoration: BoxDecoration(
                          color:Color.fromRGBO(181, 231, 77, 0.56),
                          border: Border.all(
                              color: Color.fromRGBO(181, 231, 77, 0.56)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.only(top: 1),
                      child: DropdownButtonFormField(
                        isExpanded: true,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black54,
                              letterSpacing: .2,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        value: blockdropdownvalue1,
                        validator: (value) {
                          if (blockdropdownvalue1 == null || blockdropdownvalue1=="Select Block") {
                            return 'Please select';
                          }
                          return null;
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: blockitems1.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          int i1, i3;
                          String i2;
                          List<String> newList=["Select Village"];
                          setState(() {
                            blockdropdownvalue1 = newValue!;
                            villagedropdownvalue1 = "Select Village";
                            farmerdropdownvalue1 = "Select Farmer";
                            i1 = box1?.get("block1").indexOf(newValue);
                            print("len"+villageitems1.length.toString());
                            print(i1);
                            print(newList);
                            villageBID1.asMap().forEach((index, element) {
                              print(element);
                              print(i1);
                              print("nect");
                              print(newList);
                              print(box1?.get("village1")[index]);
                              if(element.toString() == i1.toString()){
                                print(newList);
                                print("index"+index.toString());
                                print(box1?.get("village1")[index+1]);
                                newList.add(box1?.get("village1")[index+1]);
                              }
                            });
                            print(newList);
                            villageitems1 = newList;
                          });
                          formGlobalKey2.currentState!.validate();
                        },
                      )
                  ),),


                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "Village1",
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
                  Form(
                    key: formGlobalKey3,
                    child: Container(
                      padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                      decoration: BoxDecoration(
                          color:Color.fromRGBO(181, 231, 77, 0.56),
                          border: Border.all(
                              color: Color.fromRGBO(181, 231, 77, 0.56)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.only(top: 1),
                      child: DropdownButtonFormField(
                        isExpanded: true,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black54,
                              letterSpacing: .2,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        value: villagedropdownvalue1,
                        validator: (value) {
                          if (villagedropdownvalue1 == null || villagedropdownvalue1=="Select Village") {
                            return 'Please select a Village';
                          }
                          return null;
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: villageitems1.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          int i1, i3;
                          String i2;
                          List<String> newList=["Select Farmer"];
                          setState(() {
                            villagedropdownvalue1 = newValue!;
                            farmerdropdownvalue1 = "Select Farmer";
                            i1 = box1?.get("village1").indexOf(newValue);
                            print("len"+farmeritems1.length.toString());
                            print(i1);
                            print(newList);
                            if(dropdownvalue == "Visit 1: Demand"){

                              print("hello broter");

                              farmerVID1.asMap().forEach((index, element) {
                                if(element.toString() == i1.toString()){
                                  newList.add(box1?.get("farmer1")[index+1]);
                                }
                              });

                              box1?.get("regFID").asMap().forEach((ind,ele){
                                if(box1?.get("regYear")[ind].toString()==yearController.text.toString()){
                                  print(ele);
                                  farmerFID1.asMap().forEach((index, element) {
                                    print(element);
                                    if(element==ele){
                                      print("REMOVING ELE:"+box1?.get("farmer1")[index+1]);
                                      print("REMOVING ELE:"+newList[index+1]);
                                      newList.removeAt(index+1);
                                    }
                                  });
                                }
                              });
                              // box1?.get("regFID").asMap().forEach((index1, element1) {
                              //   farmerVID1.asMap().forEach((index, element) {
                              //     if(box1?.get("regYear")[index1].toString()==yearController.text.toString()){
                              //       //print("YEAR: "+yearController.text.toString());
                              //       //print("INDEXXXXX"+index1.toString());
                              //       //print(element1);
                              //       //print(farmerFID1[index]);
                              //       if(element1.toString() == farmerFID1[index]){
                              //         print("ELE: "+box1?.get("farmer1")[index+1]);
                              //
                              //         // if(!newList.contains(box1?.get("farmer1")[index+1])) {
                              //         //   //print(!newList.contains(box1?.get("farmer1")[index+1]));
                              //         //   //newList.add(box1?.get("farmer1")[index+1]);
                              //         //   print("ELE: "+box1?.get("farmer1")[index+1]);
                              //         // }
                              //       }else{
                              //         print("-------------------");
                              //         print("ELE1: "+box1?.get("farmer1")[index+1]);
                              //       }
                              //     }
                              //   });
                              // });

                              //farmerVID1.asMap().forEach((index, element) {
                                // print(element);
                                // print(i1);



                                // if(element.toString() == i1.toString()){
                                //   print("--------------");
                                //   print("eroo");
                                //   box1?.get("regFID").asMap().forEach((index1, element1) {
                                //     print("ABCCCCC");
                                //     print(box1?.get("regYear")[index1].toString());
                                //     print("Farmer value: "+farmerFID1[index]);
                                //     print("YEAR"+box1?.get("regYear")[index1]);
                                //     print("YEAR*"+yearController.text.toString());
                                //     if(box1?.get("regYear")[index1].toString()==yearController.text.toString()){
                                //       print("FORM"+farmerFID1[index].toString());
                                //       print("FORM1"+element1.toString());
                                //       print("FORM@"+box1?.get("farmer1")[index+1]);
                                //
                                //       if(element1.toString() != farmerFID1[index]){
                                //         print("NOOOOOOOOOOOOOOOOOO");
                                //         // print("ABCCCCCDDDDDDDD");
                                //         // print(newList);
                                //         // print("index"+index.toString());
                                //         // print(box1?.get("farmer1")[index+1]);
                                //         // //newList.add(box1?.get("farmer1")[index+1]);

                                //       }else{
                                //         print("OKYYYYYYYYYYYYYYYYYYYYYYYY");
                                //       }
                                //     }
                                //   });
                                // }
                             // });

                            }else if(dropdownvalue == "Visit 2: Distribution"){

                              print("disributionLISTTTTTTTTTT");


                              farmerVID1.asMap().forEach((index, element) {
                                print(element);
                                print(i1);

                                if(element.toString() == i1.toString()){
                                  print("eroo");
                                  box1?.get("regFID").asMap().forEach((index1, element1) {
                                    print("ABCCCCC");
                                    print(box1?.get("regYear")[index1].toString());
                                    print("Farmer value: "+farmerFID1[index]);
                                        if(box1?.get("regYear")[index1].toString()==yearController.text.toString()){
                                          if(element1.toString() == farmerFID1[index]){
                                      print(newList);
                                      print("index"+index.toString());
                                      print(box1?.get("farmer1")[index+1]);
                                      if(!newList.contains(box1?.get("farmer1")[index+1])) {
                                        newList.add(box1?.get("farmer1")[index+1]);
                                      }
                                    }
                                    }
                                  });
                                }
                              });

                              box1?.get("distributionFID").asMap().forEach((ind,ele){
                                if(box1?.get("distributionYear")[ind].toString()==yearController.text.toString()){
                                  print(ele);
                                  farmerFID1.asMap().forEach((index, element) {
                                    print(element);
                                    if(element==ele){
                                      print("REMOVING ELE:"+box1?.get("farmer1")[index+1]);
                                      //print("REMOVING ELE:"+newList[index+1]);
                                      newList.remove(box1?.get("farmer1")[index+1]);
                                    }
                                  });
                                }
                              });

                            }
                            else if(dropdownvalue == "Visit 3: Plantation"){

                              farmerVID1.asMap().forEach((index, element) {
                               // print(element);
                                // print(i1);
                                // print("nect1");
                                // print(newList);
                                // print(box1?.get("farmer1")[index]);
                                if(element.toString() == i1.toString()){
                                  box1?.get("distributionFID").asMap().forEach((index1, element1) {
                                    print("Farmer value: "+farmerFID1[index]);
                                    if(box1?.get("distributionYear")[index1].toString()==yearController.text.toString()){
                                    if(element1.toString() == farmerFID1[index]){
                                      print(newList);
                                      print("index"+index.toString());
                                      print(box1?.get("farmer1")[index+1]);
                                      //newList.add(box1?.get("farmer1")[index+1]);
                                      if(!newList.contains(box1?.get("farmer1")[index+1])) {
                                        newList.add(box1?.get("farmer1")[index+1]);
                                      }
                                    }}
                                  });
                                }
                              });


                              box1?.get("plantationFID").asMap().forEach((ind,ele){
                                if(box1?.get("plantationYear")[ind].toString()==yearController.text.toString()){
                                  print(ele);
                                  farmerFID1.asMap().forEach((index, element) {
                                    print(element);
                                    if(element==ele){
                                      newList.remove(box1?.get("farmer1")[index+1]);
                                    }
                                  });
                                }
                              });

                            }

                            else if(dropdownvalue == "Visit 4: FollowUp1"){
                              print("sat");

                              farmerVID1.asMap().forEach((index, element) {
                                // print(element);
                                // print(i1);
                                // print("nect1");
                                // print(newList);
                                // print(box1?.get("farmer1")[index]);
                                print("Farmer element val1"
                                    ": "+element);
                                print("Farmer element val2: "+i1.toString());
                                if(element.toString() == i1.toString()){
                                  box1?.get("plantationFID").asMap().forEach((index1, element1) {
                                    print("Farmer element val: "+element1);
                                    print("Farmer value: "+farmerFID1[index]);
                                    if(box1?.get("plantationYear")[index1].toString()==yearController.text.toString()){
                                    if(element1.toString() == farmerFID1[index]){
                                      print(newList);
                                      print("index: hh: "+index.toString());
                                      print(box1?.get("farmer1")[index+1]);
                                      //newList.add(box1?.get("farmer1")[index+1]);
                                      if(!newList.contains(box1?.get("farmer1")[index+1])) {
                                        newList.add(box1?.get("farmer1")[index+1]);
                                        print("hey");

                                      }
                                      print("listnew"+newList.toString());
                                    }}
                                  });
                                }
                              });

                            }

                            else if(dropdownvalue == "Visit 5: FollowUp2"){

                              farmerVID1.asMap().forEach((index, element) {
                                // print(element);
                                // print(i1);
                                // print("nect1");
                                // print(newList);
                                // print(box1?.get("farmer1")[index]);
                                if(element.toString() == i1.toString()){
                                  box1?.get("fu1FID").asMap().forEach((index1, element1) {
                                    print("Farmer value: "+farmerFID1[index]);
                                    if(box1?.get("fu1Year")[index1].toString()==yearController.text.toString()){
                                    if(element1.toString() == farmerFID1[index]){
                                      print(newList);
                                      print("index"+index.toString());
                                      print(box1?.get("farmer1")[index+1]);
                                      //newList.add(box1?.get("farmer1")[index+1]);
                                      if(!newList.contains(box1?.get("farmer1")[index+1])) {
                                        newList.add(box1?.get("farmer1")[index+1]);
                                      }
                                    }}
                                  });
                                }
                              });

                            }

                            else if(dropdownvalue == "Conclusion"){

                              farmerVID1.asMap().forEach((index, element) {
                                // print(element);
                                // print(i1);
                                // print("nect1");
                                // print(newList);
                                // print(box1?.get("farmer1")[index]);
                                if(element.toString() == i1.toString()){
                                  box1?.get("fu2FID").asMap().forEach((index1, element1) {
                                    print("Farmer value: "+farmerFID1[index]);
                                    if(element1.toString() == farmerFID1[index]){
                                      print(newList);
                                      print("index"+index.toString());
                                      print(box1?.get("farmer1")[index+1]);
                                      //newList.add(box1?.get("farmer1")[index+1]);
                                      if(!newList.contains(box1?.get("farmer1")[index+1])) {
                                        newList.add(box1?.get("farmer1")[index+1]);
                                      }
                                    }
                                  });
                                }
                              });


                            }
                            print(newList);
                            farmeritems1 = newList;
                          });
                          formGlobalKey3.currentState!.validate();
                        },
                      )
                  ),),


                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "Farmer1",
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
                  Form(
                    key: formGlobalKey4,
                    child: Container(
                      padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                      decoration: BoxDecoration(
                          color:Color.fromRGBO(181, 231, 77, 0.56),
                          border: Border.all(
                              color: Color.fromRGBO(181, 231, 77, 0.56)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.only(top: 1),
                      child: DropdownButtonFormField(
                        isExpanded: true,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black54,
                              letterSpacing: .2,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        value: farmerdropdownvalue1,
                        validator: (value) {
                          if (farmerdropdownvalue1 == null || farmerdropdownvalue1=="Select Farmer") {
                            return 'Please select a Farmer';
                          }
                          return null;
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: farmeritems1.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          bool showPOP = false;
                          setState(() {

                            farmerdropdownvalue1 = newValue!;
                            aadharController.clear();
                            phoneController.clear();
                            dropdownvalue2="Male";

                            i1 = box1?.get("farmer1").indexOf(newValue);
                            print(i1);
                            print("i1-------> "+i1.toString());
                            if(dropdownvalue == "Visit 2: Distribution"){
                              box1?.get("regFID").asMap().forEach((index, element) {
                                print(element);
                                print(i1);
                                print("nect1");
                                print(box1?.get("regFID")[index]);
                                if(element.toString() == i1.toString()){
                                  print("index"+index.toString());
                                  aadharController.text = box1?.get("regAD")[index];
                                  phoneController.text = box1?.get("regPhone")[index];
                                  dropdownvalue2 = box1?.get("regGender")[index];
                                  print(box1?.get("regPhone")[index]);
                                  showPOP = false;
                                }
                              });
                            }
                            if(dropdownvalue == "Visit 3: Plantation"){
                              box1?.get("distributionFID").asMap().forEach((index, element) {
                                print(element);
                                print(i1);
                                print("nect1");
                                print(box1?.get("distributionFID")[index]);
                                if(element.toString() == i1.toString()){
                                  print("index"+index.toString());

                                  aadharController.text = box1?.get("distributionAd")[index];
                                  phoneController.text = box1?.get("distributionPhone")[index];
                                  dropdownvalue2 = box1?.get("distributionGender")[index];
                                  //print(box1?.get("regPhone")[index]);
                                  showPOP = false;
                                }
                              });
                            }
                            if(dropdownvalue == "Visit 4: FollowUp1"){
                              box1?.get("plantationFID").asMap().forEach((index, element) {
                                print(element);
                                print(i1);
                                print("nect1");
                                print(box1?.get("plantationFID")[index]);
                                if(element.toString() == i1.toString()){
                                  print("index"+index.toString());

                                  aadharController.text = box1?.get("plantationAd")[index];
                                  phoneController.text = box1?.get("plantationPhone")[index];
                                  dropdownvalue2 = box1?.get("plantationGender")[index];
                                  print(box1?.get("regPhone")[index]);
                                  showPOP = false;
                                }
                              });
                            }if(dropdownvalue == "Visit 5: FollowUp2"){
                              box1?.get("fu1FID").asMap().forEach((index, element) {
                                print(element);
                                print(i1);
                                print("nect1");
                                print(box1?.get("fu1FID")[index]);
                                if(element.toString() == i1.toString()){
                                  print("index"+index.toString());

                                  aadharController.text = box1?.get("fu1Ad")[index];
                                  phoneController.text = box1?.get("fu1Phone")[index];
                                  dropdownvalue2 = box1?.get("fu1Gender")[index];
                                  print(box1?.get("regPhone")[index]);
                                  showPOP = false;
                                }
                              });
                            }if(dropdownvalue == "Conclusion"){
                              box1?.get("fu2FID").asMap().forEach((index, element) {
                                print(element);
                                print(i1);
                                print("nect1");
                                print(box1?.get("fu2FID")[index]);
                                if(element.toString() == i1.toString()){
                                  print("index"+index.toString());

                                  aadharController.text = box1?.get("regAd")[index];
                                  phoneController.text = box1?.get("regPhone")[index];
                                  dropdownvalue2 = box1?.get("regGender")[index];
                                  print(box1?.get("regPhone")[index]);
                                  showPOP = false;
                                }
                              });
                            }
                          });
                          if(dropdownvalue != "Visit 1: Demand") {
                                    if (aadharController.text.isEmpty) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialogNotReg(context),
                                      );
                                    }
                                  }
                          formGlobalKey4.currentState!.validate();
                        },
                      )
                  ),),



                  // SizedBox(height: 20,),
                  // Container(
                  //   child: Text(
                  //     "District",
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
                  // Form(
                  //   child: Container(
                  //     padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                  //     decoration: BoxDecoration(
                  //         color:Color.fromRGBO(181, 231, 77, 0.56),
                  //         border: Border.all(
                  //             color: Color.fromRGBO(181, 231, 77, 0.56)
                  //         ),
                  //         borderRadius: BorderRadius.all(Radius.circular(10))
                  //     ),
                  //     margin: EdgeInsets.only(top: 1),
                  //     child: FutureBuilder<List>(
                  //       future: makePostRequest(url, unencodedPath, headers),
                  //       builder: (context, snapshot) {
                  //         if (snapshot.hasData) {
                  //           return DropdownButtonFormField(
                  //             isExpanded: true,
                  //             style: GoogleFonts.lato(
                  //               textStyle: TextStyle(
                  //                   color: Colors.black54,
                  //                   letterSpacing: .2,
                  //                   fontSize: 16,
                  //                   fontWeight: FontWeight.w600
                  //               ),
                  //             ),
                  //             value: dropdownvalue1,
                  //             validator: (value) {
                  //               print("inside validator");
                  //               if (dropdownvalue1 == null || dropdownvalue1=="Select District") {
                  //                 print("value"+value.toString());
                  //                 return 'Please select';
                  //               }
                  //               return null;
                  //             },
                  //             icon: const Icon(Icons.keyboard_arrow_down),
                  //             items: snapshot.data?.map((items) {
                  //               return DropdownMenuItem(
                  //                 value: items,
                  //                 child: Text(items),
                  //                 enabled: items != 'Select District',
                  //               );
                  //             }).toList(),
                  //             // After selecting the desired option,it will
                  //             // change button value to selected value
                  //             onChanged: (newValue) async {
                  //               print(newValue);
                  //               print("object");
                  //
                  //               print("data_getting"+newValue.toString());
                  //               int index = items8.indexOf(newValue.toString())-1;
                  //               print("34index of item: "+index.toString());
                  //               print("34district id"+districtID[index]);
                  //               int i = 0;
                  //               // print("34District id: "+districtID[index].toString());
                  //               // print("34block id: "+blockID[index].toString());
                  //               urlBlock1 = 'https://stand4land.in/plantation_app/get_block_data_from_did.php';
                  //               urlBlock1 = urlBlock1+"?did="+districtID[index];
                  //               //makePostRequest1(urlBlock1, unencodedPath, headers);
                  //               List<String> itemsBlock1;
                  //               itemsBlock1 = await makePostRequest1(urlBlock1, unencodedPath, headers);
                  //               print("changed value from block");
                  //               print(itemsBlock1);
                  //
                  //               setState(() {
                  //                 print("BlockNameVale0"+blockNameValue);
                  //                 blockNameValue="Select Block";
                  //                 print("BlockNameVale"+blockNameValue);
                  //                 dropdownvalue1 = newValue.toString();
                  //                 //getDistrictID(newValue.toString());
                  //                 //getBlockDatafromDistrict(newValue.toString());
                  //                 //itemsBlock = getBlockDatafromDistrict(newValue.toString());
                  //                 itemsBlock = itemsBlock1;
                  //                 //_buildDropDownBlock(context);
                  //                 formGlobalKey.currentState!.validate();
                  //               });
                  //             },
                  //
                  //           );
                  //         }
                  //         return Center(child: CircularProgressIndicator());
                  //       },
                  //     ),
                  //     // child: DropdownButton(
                  //     //   isExpanded: true,
                  //     //   style: GoogleFonts.lato(
                  //     //     textStyle: TextStyle(
                  //     //         color: Colors.black54,
                  //     //         letterSpacing: .2,
                  //     //         fontSize: 16,
                  //     //         fontWeight: FontWeight.w600
                  //     //     ),
                  //     //   ),
                  //     //   value: dropdownvalue1,
                  //     //   icon: const Icon(Icons.keyboard_arrow_down),
                  //     //   items: items1.map((String items) {
                  //     //     return DropdownMenuItem(
                  //     //       value: items,
                  //     //       child: Text(items),
                  //     //       enabled: items != 'Select District',
                  //     //     );
                  //     //   }).toList(),
                  //     //   // After selecting the desired option,it will
                  //     //   // change button value to selected value
                  //     //   onChanged: (String? newValue) {
                  //     //     setState(() {
                  //     //       dropdownvalue1 = newValue!;
                  //     //     });
                  //     //   },
                  //     // )
                  // ),),
                  //
                  //
                  // SizedBox(height: 20,),
                  // Container(
                  //   child: Text(
                  //     "Block Name",
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
                  //     padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                  //     decoration: BoxDecoration(
                  //         color:Color.fromRGBO(181, 231, 77, 0.56),
                  //         border: Border.all(
                  //             color: Color.fromRGBO(181, 231, 77, 0.56)
                  //         ),
                  //         borderRadius: BorderRadius.all(Radius.circular(10))
                  //     ),
                  //     margin: EdgeInsets.only(top: 1),
                  //     child: _buildDropDownBlock(context)
                  //     // child: FutureBuilder<List>(
                  //     //   future: makePostRequest1(urlBlock, unencodedPath, headers),
                  //     //   builder: (context, snapshot) {
                  //     //     if (snapshot.hasData) {
                  //     //       return DropdownButton(
                  //     //         isExpanded: true,
                  //     //         style: GoogleFonts.lato(
                  //     //           textStyle: TextStyle(
                  //     //               color: Colors.black54,
                  //     //               letterSpacing: .2,
                  //     //               fontSize: 16,
                  //     //               fontWeight: FontWeight.w600
                  //     //           ),
                  //     //         ),
                  //     //         value: blockNameValue,
                  //     //         icon: const Icon(Icons.keyboard_arrow_down),
                  //     //         items: snapshot.data?.map((items) {
                  //     //           return DropdownMenuItem(
                  //     //             value: items,
                  //     //             child: Text(items),
                  //     //             enabled: items != 'Select Block',
                  //     //           );
                  //     //         }).toList(),
                  //     //         // After selecting the desired option,it will
                  //     //         // change button value to selected value
                  //     //         onChanged: (newValue) {
                  //     //           print(newValue);
                  //     //           print("object");
                  //     //           setState(() {
                  //     //             blockNameValue = newValue.toString();
                  //     //             getBlockID(newValue.toString());
                  //     //           });
                  //     //         },
                  //     //       );
                  //     //     }
                  //     //     return Center(child: CircularProgressIndicator());
                  //     //   },
                  //     // )
                  // ),
                  //
                  //
                  // SizedBox(height: 20,),
                  // Container(
                  //   child: Text(
                  //     "Village Name",
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
                  // Form(
                  //   child: Container(
                  //     padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                  //     decoration: BoxDecoration(
                  //         color:Color.fromRGBO(181, 231, 77, 0.56),
                  //         border: Border.all(
                  //             color: Color.fromRGBO(181, 231, 77, 0.56)
                  //         ),
                  //         borderRadius: BorderRadius.all(Radius.circular(10))
                  //     ),
                  //     margin: EdgeInsets.only(top: 1),
                  //     child: DropdownButtonFormField(
                  //       isExpanded: true,
                  //       style: GoogleFonts.lato(
                  //         textStyle: TextStyle(
                  //             color: Colors.black54,
                  //             letterSpacing: .2,
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w600
                  //         ),
                  //       ),
                  //       value: villageNameValue,
                  //       validator: (value) {
                  //         if (villageNameValue == null || villageNameValue=="Select Village") {
                  //           print("value"+value.toString());
                  //           return 'Please select a Village';
                  //         }
                  //         return null;
                  //       },
                  //       icon: const Icon(Icons.keyboard_arrow_down),
                  //       items: itemsVillage.map((String items) {
                  //         return DropdownMenuItem(
                  //           value: items,
                  //           child: Text(items),
                  //           enabled: items != 'Select Village',
                  //         );
                  //       }).toList(),
                  //       // After selecting the desired option,it will
                  //       // change button value to selected value
                  //       onChanged: (String? newValue) async {
                  //         print("all prints here -------------> ");
                  //         print(newValue);
                  //         print("vv"+villageNameValue);
                  //         print(itemsVillage);
                  //
                  //         int index = itemsVillage.indexOf(newValue.toString())-1;
                  //         print("34133index of item: "+index.toString());
                  //         print("34133district id"+villageID[index]);
                  //         int i = 0;
                  //         // print("34District id: "+districtID[index].toString());
                  //         // print("34block id: "+blockID[index].toString());
                  //         urlFarmer1 = 'https://stand4land.in/plantation_app/get_farmer_data_from_vid.php';
                  //         urlFarmer1 = urlFarmer1+"?did="+villageID[index];
                  //         print("VNameValue3"+newValue.toString());
                  //         List<String> itemsVillage1;
                  //         itemsVillage1 = await makePostRequest3(urlFarmer1, unencodedPath, headers);
                  //         print("VNameValue6"+newValue.toString());
                  //         itemsVillage1.forEach((item) async {
                  //           print("34 i: "+item);
                  //         });
                  //
                  //         setState(() {
                  //           villageNameValue = newValue!;
                  //           print("all prints here1 -------------> ");
                  //           print(newValue);
                  //           print("vv"+villageNameValue);
                  //           print(itemsVillage);
                  //           itemsFarmer=itemsVillage1;
                  //           print("consent value"+_validateYear.toString());
                  //           formGlobalKey3.currentState!.validate();
                  //           farmerNameValue = "Select Farmer";
                  //         });
                  //       },
                  //     ),
                  //     // child: FutureBuilder<List>(
                  //     //   future: makePostRequest2(urlVillage, unencodedPath, headers),
                  //     //   builder: (context, snapshot) {
                  //     //     if (snapshot.hasData) {
                  //     //       return DropdownButton(
                  //     //         isExpanded: true,
                  //     //         style: GoogleFonts.lato(
                  //     //           textStyle: TextStyle(
                  //     //               color: Colors.black54,
                  //     //               letterSpacing: .2,
                  //     //               fontSize: 16,
                  //     //               fontWeight: FontWeight.w600
                  //     //           ),
                  //     //         ),
                  //     //         value: villageNameValue,
                  //     //         icon: const Icon(Icons.keyboard_arrow_down),
                  //     //         items: snapshot.data?.map((items) {
                  //     //           return DropdownMenuItem(
                  //     //             value: items,
                  //     //             child: Text(items),
                  //     //             enabled: items != 'Select Village',
                  //     //           );
                  //     //         }).toList(),
                  //     //         // After selecting the desired option,it will
                  //     //         // change button value to selected value
                  //     //         onChanged: (newValue) {
                  //     //           print(newValue);
                  //     //           print("object");
                  //     //           setState(() {
                  //     //             villageNameValue = newValue.toString();
                  //     //           });
                  //     //         },
                  //     //       );
                  //     //     }
                  //     //     return Center(child: CircularProgressIndicator());
                  //     //   },
                  //     // ),
                  // ),),
                  //
                  // SizedBox(height: 20,),
                  // Container(
                  //   child: Text(
                  //     "Farmer Name",
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
                  // Form(
                  //   child: Container(
                  //     padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                  //     decoration: BoxDecoration(
                  //         color:Color.fromRGBO(181, 231, 77, 0.56),
                  //         border: Border.all(
                  //             color: Color.fromRGBO(181, 231, 77, 0.56)
                  //         ),
                  //         borderRadius: BorderRadius.all(Radius.circular(10))
                  //     ),
                  //     margin: EdgeInsets.only(top: 1),
                  //     child: DropdownButtonFormField(
                  //       isExpanded: true,
                  //       style: GoogleFonts.lato(
                  //         textStyle: TextStyle(
                  //             color: Colors.black54,
                  //             letterSpacing: .2,
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w600
                  //         ),
                  //       ),
                  //       value: farmerNameValue,
                  //       validator: (value) {
                  //         if (farmerNameValue == null || farmerNameValue=="Select Farmer") {
                  //           print("value"+value.toString());
                  //           return 'Please select a Farmer';
                  //         }
                  //         return null;
                  //       },
                  //       icon: const Icon(Icons.keyboard_arrow_down),
                  //       items: itemsFarmer.map((String items) {
                  //         return DropdownMenuItem(
                  //           value: items,
                  //           child: Text(items),
                  //           enabled: items != 'Select Farmer',
                  //         );
                  //       }).toList(),
                  //       // After selecting the desired option,it will
                  //       // change button value to selected value
                  //       onChanged: (String? newValue) async {
                  //         setState(() {
                  //           farmerNameValue = newValue!;
                  //           //print("consent value"+_validateYear.toString());
                  //           formGlobalKey4.currentState!.validate();
                  //         });
                  //       },
                  //     ),
                  //     // child: FutureBuilder<List>(
                  //     //   future: makePostRequest3(urlFarmer, unencodedPath, headers),
                  //     //   builder: (context, snapshot) {
                  //     //     if (snapshot.hasData) {
                  //     //       return DropdownButtonFormField(
                  //     //         isExpanded: true,
                  //     //         style: GoogleFonts.lato(
                  //     //           textStyle: TextStyle(
                  //     //               color: Colors.black54,
                  //     //               letterSpacing: .2,
                  //     //               fontSize: 16,
                  //     //               fontWeight: FontWeight.w600
                  //     //           ),
                  //     //         ),
                  //     //         value: farmerNameValue,
                  //     //         validator: (value) {
                  //     //           if (farmerNameValue == null || farmerNameValue=="Select Farmer") {
                  //     //             return 'Please select a farmer';
                  //     //           }
                  //     //           return null;
                  //     //         },
                  //     //         icon: const Icon(Icons.keyboard_arrow_down),
                  //     //         items: snapshot.data?.map((items) {
                  //     //           return DropdownMenuItem(
                  //     //             value: items,
                  //     //             child: Text(items),
                  //     //             enabled: items != 'Select Farmer',
                  //     //           );
                  //     //         }).toList(),
                  //     //         // After selecting the desired option,it will
                  //     //         // change button value to selected value
                  //     //         onChanged: (newValue) {
                  //     //           print(newValue);
                  //     //           print("object");
                  //     //           setState(() {
                  //     //             farmerNameValue = newValue.toString();
                  //     //             formGlobalKey4.currentState!.validate();
                  //     //           });
                  //     //         },
                  //     //       );
                  //     //     }
                  //     //     return Center(child: CircularProgressIndicator());
                  //     //   },
                  //     // ),
                  // ),),

                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "Aadhar Number",
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
                        color:Color.fromRGBO(181, 231, 77, 0.56),
                        border: Border.all(
                            color: Color.fromRGBO(181, 231, 77, 0.56)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    margin: EdgeInsets.only(top: 1),
                    child: TextField(
                      onChanged: (value){
                        setState(() {
                          print("insideset state");
                          if(aadharController.text.isEmpty){
                            _validateAd = true;
                            adText="Enter Aadhar Number";
                          }else {
                            if(aadharController.text.length != 12){
                              _validateAd = true;
                              adText="Incorrect Aadhar Number";
                            }else{
                              _validateAd = false;
                            }
                          }
                          // aadharController.text.isEmpty ? _validateAd = true :
                          // aadharController.text.length != 12 ? _validateAd = true : _validateAd = false;
                          print(_validateAd);
                        });
                      },
                      controller: aadharController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        //contentPadding: EdgeInsets.all(1),
                        hintText: "Enter your Aadhar Number",
                        prefixIcon: Icon(Icons.credit_card_rounded),
                        errorText: _validateAd ? adText : null,
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

                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "Phone No",
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
                          color:Color.fromRGBO(181, 231, 77, 0.56),
                          border: Border.all(
                              color: Color.fromRGBO(181, 231, 77, 0.56)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.only(top: 1),
                      child: TextField(
                        onChanged: (value){
                          setState(() {
                            print("insideset state");
                            if(phoneController.text.isEmpty){
                              _validatePhone = true;
                              phText="Enter Phone Number";
                            }else {
                              if(phoneController.text.length != 10){
                                _validatePhone = true;
                                phText="Incorrect Phone Number";
                              }else{
                                _validatePhone = false;
                              }
                            }
                          });
                        },
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //contentPadding: EdgeInsets.all(1),
                          hintText: 'Enter your Phone No',
                          prefixIcon: Icon(Icons.phone),
                          errorText: _validatePhone ? phText : null,
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

                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "Gender",
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
                          color:Color.fromRGBO(181, 231, 77, 0.56),
                          border: Border.all(
                              color: Color.fromRGBO(181, 231, 77, 0.56)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.only(top: 1),
                      child: DropdownButton(
                        isExpanded: true,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black54,
                              letterSpacing: .2,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        value: dropdownvalue2,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items2.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue2 = newValue!;
                          });
                        },
                      )
                  ),


                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 1.0,
                      onPressed: (){
                        setState(() {
                          yearController.text.isEmpty ? _validateYear = true : _validateYear = false;
                          //aadharController.text.isEmpty ? _validateAd = true : _validateAd = false;
                          // aadharController.text.isEmpty ? _validateAd = true :
                          // aadharController.text.length != 12 ? _validateAd = true : _validateAd = false;

                          if(aadharController.text.isEmpty){
                            _validateAd = true;
                            adText="Enter Aadhar Number";
                          }else {
                            if(aadharController.text.length != 12){
                              _validateAd = true;
                              adText="Incorrect Aadhar Number";
                            }else{
                              _validateAd = false;
                            }
                          }

                          if(phoneController.text.isEmpty){
                            _validatePhone = true;
                            phText="Enter Phone Number";
                          }else {
                            if(phoneController.text.length != 10){
                              _validatePhone = true;
                              phText="Incorrect Phone Number";
                            }else{
                              _validatePhone = false;
                            }
                          }
                        });

                        print("YEARRRRRRRRRRRRR"+yearController.text);
                        box4?.put("yearSel", yearController.text);

                        if(dropdownvalue=="Visit 1: Demand"){
                        if (formGlobalKey.currentState!.validate()&&formGlobalKey2.currentState!.validate()
                            &&formGlobalKey3.currentState!.validate()&&formGlobalKey4.currentState!.validate()
                            &&yearController.text!=""&&aadharController.text!=""&&phoneController.text!="") {
                          // use the information provided
                          print("inside this");
                          // _buildPopupDialog(context);
                          if(dropdownvalue=="Visit 1: Demand"){

                            print("i----------: "+i1.toString());

                            Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerDemand(
                                yearController.text,
                                dropdownvalue,
                                dateController.text,
                                districtdropdownvalue1,
                                blockdropdownvalue1,
                                villagedropdownvalue1,
                                farmerdropdownvalue1,
                                aadharController.text,
                                phoneController.text,
                                dropdownvalue2,
                                i1.toString()
                            ),),);
                          }
                        }
                        } else if(dropdownvalue=="Visit 2: Distribution"){

                          if (formGlobalKey.currentState!.validate()&&formGlobalKey2.currentState!.validate()
                              &&formGlobalKey3.currentState!.validate()&&formGlobalKey4.currentState!.validate()
                              &&yearController.text!="") {

                            // url = 'https://stand4land.in/plantation_app/surveyor_login.php';
                            //
                            // Map<String,String> body = {'user_id': controllerUserID.text, 'password': controllerPass.text};
                            //
                            // url = url+"?user_id="+controllerUserID.text+"&password="+controllerPass.text;
                            // print("URL"+url);
                            // makePostRequest(url, unencodedPath, headers, body);

                            // _buildPopupDialog(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerDistribution(farmerdropdownvalue1, i1),),);
                          }
                        }else if(dropdownvalue=="Visit 3: Plantation"){
                          if (formGlobalKey.currentState!.validate()&&formGlobalKey2.currentState!.validate()
                              &&formGlobalKey3.currentState!.validate()&&formGlobalKey4.currentState!.validate()
                              &&yearController.text!="") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerPlantation(farmerdropdownvalue1, i1),),);
                          }
                        }else if(dropdownvalue=="Visit 4: FollowUp1"){
                          if (formGlobalKey.currentState!.validate()&&formGlobalKey2.currentState!.validate()
                              &&formGlobalKey3.currentState!.validate()&&formGlobalKey4.currentState!.validate()
                              &&yearController.text!="") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerFollowUP1(farmerdropdownvalue1, i1, {}),),);
                          }
                        }else if(dropdownvalue=="Visit 5: FollowUp2"){
                          if (formGlobalKey.currentState!.validate()&&formGlobalKey2.currentState!.validate()
                              &&formGlobalKey3.currentState!.validate()&&formGlobalKey4.currentState!.validate()
                              &&yearController.text!="") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerFollowUP2(farmerdropdownvalue1, i1, {}),),);
                          }
                        }else if(dropdownvalue=="Conclusion"){
                          if (formGlobalKey.currentState!.validate()&&formGlobalKey2.currentState!.validate()
                              &&formGlobalKey3.currentState!.validate()&&formGlobalKey4.currentState!.validate()
                              &&yearController.text!="") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerConclusion(farmerdropdownvalue1, i1, {}),),);
                          }
                        }

                        // if(yearController.text!=""){
                        //
                        // }
                      },
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.black54,
                      child: Icon(Icons.arrow_forward_ios_outlined,
                        color: Colors.white,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
          ],
        )
      ),)
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    print("object22");
        return new AlertDialog(
          title: Text("Select Year"),
          content: Container( // Need to use container to add size constraint.
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 100, 1),
              initialDate: DateTime.now(),
              // save the selected date to _selectedDate DateTime variable.
              // It's used to set the previous selected date when
              // re-showing the dialog.
              selectedDate: _selected,
              onChanged: (DateTime dateTime) {
                setState(() {
                  _validateYear=false;
                });
                // close the dialog when year is selected.
                yearController.text=dateTime.year.toString();
                Navigator.pop(context);
                // Do something with the dateTime selected.
                // Remember that you need to use dateTime.year to get the year
              },
            ),
          ),
        );
  }



  List<dynamic> getDistrictID(String name) {
    int index = items8.indexOf(name)-1;
    print("1234index of item: "+index.toString());
    print("1234district id"+districtID[index]);
    int i = 0;
    print("District id: "+districtID.toString());
    print("block id: "+blockID.toString());
    var itemsBlock1 = [];
    blockDID.forEach((item) async {
      print("1234 i: "+item);
      if(item==districtID[index]){
        int index1 = blockDID.indexOf(item);
        print("1234 a"+blockID[i]);
        await makePostRequest1(urlBlock, unencodedPath, headers);
        itemsBlock1.add("Select Block");
        itemsBlock1.add(itemsBlock[i]);
        //itemsBlock.clear();
        //itemsBlock1.add("Select Block");

      }
      i+=1;
    });
    return itemsBlock1;

  }

  void getBlockID(String name) {
    int index = itemsBlock.indexOf(name);
    print("block id"+blockID[index]);
    final index1 = items8.indexWhere((element) =>
    element == name);
    print("block id 222: "+index1.toString());
    print("block id1"+districtID[index]);
  }

  getBlockData() {
    if(itemsBlock.length==1){
      return makePostRequest1(urlBlock, unencodedPath, headers);
    }else if(itemsBlock.length>1){
      print("1234 inside length");
      return getDistrictID(dropdownvalue1);
      // itemsBlock.remove("Select District1");
      // makePostRequest1(urlBlock, unencodedPath, headers);
    }
  }


  getBlockDatafromDistrict(String name) async {
    print("data_getting"+name);
    int index = items8.indexOf(name)-1;
    print("34index of item: "+index.toString());
    print("34district id"+districtID[index]);
    int i = 0;
    // print("34District id: "+districtID[index].toString());
    // print("34block id: "+blockID[index].toString());
    urlBlock1 = 'https://stand4land.in/plantation_app/get_block_data_from_did.php';
    urlBlock1 = urlBlock1+"?did="+districtID[index];
    makePostRequest1(urlBlock1, unencodedPath, headers);
    List<String> itemsBlock1;
    itemsBlock1 = await makePostRequest1(urlBlock1, unencodedPath, headers);
    print("itemsblockohhhhh"+itemsBlock1.toString());
    //newQuestions.
    return itemsBlock1;
    //return itemsBlock;
  }

  // getVillageDatafromBlock(String name){
  //   int index = itemsBlock.indexOf(name)-1;
  //   print("341index of item: "+index.toString());
  //   print("341district id"+blockID[index]);
  //   int i = 0;
  //   // print("34District id: "+districtID[index].toString());
  //   // print("34block id: "+blockID[index].toString());
  //   urlVillage1 = 'https://stand4land.in/plantation_app/get_village_data_from_bid.php';
  //   urlVillage1 = urlVillage1+"?did="+blockID[index];
  //   makePostRequest2(urlVillage1, unencodedPath, headers);
  //   itemsVillage.forEach((item) async {
  //
  //     print("34 i: "+item);
  //   });
  //   return itemsVillage;
  // }


  Widget _buildDropDownBlock(BuildContext context) {
    return new Form(
      child: DropdownButtonFormField(
      isExpanded: true,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
            color: Colors.black54,
            letterSpacing: .2,
            fontSize: 16,
            fontWeight: FontWeight.w600
        ),
      ),
      value: blockNameValue,
        validator: (value) {
          print("inside validator2");
          if (blockNameValue == null || blockNameValue=="Select Block") {
            print("value"+value.toString());
            return 'Please select';
          }
          return null;
        },
      icon: const Icon(Icons.keyboard_arrow_down),
      items: itemsBlock.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
          enabled: items != 'Select Block',
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) async {

        int index = itemsBlock.indexOf(newValue.toString())-1;
        print("341index of item: "+index.toString());
        print("341district id"+blockID[index]);
        int i = 0;
        // print("34District id: "+districtID[index].toString());
        // print("34block id: "+blockID[index].toString());
        urlVillage1 = 'https://stand4land.in/plantation_app/get_village_data_from_bid.php';
        urlVillage1 = urlVillage1+"?did="+blockID[index];
        print("BlockNameValue3"+newValue.toString());
        List<String> itemsVillage1;
        itemsVillage1 = await makePostRequest2(urlVillage1, unencodedPath, headers);
        print("BlockNameValue6"+newValue.toString());
        itemsVillage1.forEach((item) async {
          print("34 i: "+item);
        });

        print("BlockNameValue3"+newValue.toString());

        setState(() {
          print("BlockNameValue3"+newValue.toString());
          blockNameValue = newValue!;
          print("BlockNameValue1"+blockNameValue);
          //getVillageDatafromBlock(newValue);
          itemsVillage=itemsVillage1;
          formGlobalKey2.currentState!.validate();
          villageNameValue="Select Village";
        });
      },
    ),);
  }


  Widget _buildPopupDialogNotReg(BuildContext context) {
    return new AlertDialog(
      title: const Text("Farmer has not been Registered Yet", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Center(child:
        Text("Please register Farmer's Demand First"),)

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
