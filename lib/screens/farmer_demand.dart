import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantationapp/screens/farmer_demand_plants.dart';
import 'package:plantationapp/screens/farmer_reg.dart';
import 'package:plantationapp/screens/surveyor_consent.dart';

import 'farmer_consent.dart';
import 'farmer_demand.dart';
import 'package:http/http.dart' as http;



class FarmerDemand extends StatefulWidget {
  //const FarmerDemand({Key? key}) : super(key: key);

  String year, status, date, district, block, village, farmer, aadhar, phone, gender, userID;


  FarmerDemand(this.year, this.status, this.date, this.district, this.block,
      this.village, this.farmer, this.aadhar, this.phone, this.gender, this.userID);

  @override
  State<FarmerDemand> createState() => _FarmerDemandState();
}

class _FarmerDemandState extends State<FarmerDemand> {



  late String year, status, date, district, block, village, farmer, aadhar, phone, gender;

  final TextEditingController demandController = new TextEditingController();

  String dropdownvalue = 'Visit 1: Demand';
  var items = [
    'Visit 1: Demand',
    'Visit 2: Distribution',
    'Visit 3: Plantation',
    'Visit 4: FollowUp1',
    'Visit 5: FollowUp2',
    'Conclusion'
  ];

  String dropdownvalue1 = 'Forest Trees';
  var items1 = [
    'Forest Trees',
    'Plants'
  ];

  int _itemCount = 0;

  var ForestTrees = ["Teak", "Drumstick", "Mahuva", "Neem", "Peepal", "Rosewood"];
  var FruitTrees = ["Mango", "Blace Plum", "White Plum", "Guava", "Caeshue Nut", "Lemon", "Jackfruit",
    "Chiku", "Tamarind", "Apple Bair", "Custard Apple", "Pomegranate", "Almond"];


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
      XFile image;
      print(items1.length);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerDemandFConsent(widget.year,
      //     widget.status, widget.date, widget.district, widget.block, widget.village, widget.farmer, widget.aadhar
      //     , widget.phone, widget.gender, dropdownvalue1, FlutterExample.FarmerDemandMap,null, widget.userID),),);
    }else{
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
            child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                      children: [
                        SizedBox(height: 40,),
                        Text(
                          "Farmer's Demand",
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
                        Text(
                          "Forest Trees",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(103, 141, 14, 1.0),
                                letterSpacing: .2,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
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
                                SizedBox(height: 40,),
                                Container(
                                  child: Text(
                                    "Demand",
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
                                //     child: DropdownButton(
                                //       isExpanded: true,
                                //       style: GoogleFonts.lato(
                                //         textStyle: TextStyle(
                                //             color: Colors.black54,
                                //             letterSpacing: .2,
                                //             fontSize: 16,
                                //             fontWeight: FontWeight.w600
                                //         ),
                                //       ),
                                //       value: dropdownvalue1,
                                //       icon: const Icon(Icons.keyboard_arrow_down),
                                //       items: items1.map((String items) {
                                //         return DropdownMenuItem(
                                //           value: items,
                                //           child: Text(items),
                                //         );
                                //       }).toList(),
                                //       // After selecting the desired option,it will
                                //       // change button value to selected value
                                //       onChanged: (String? newValue) {
                                //         setState(() {
                                //           dropdownvalue1 = newValue!;
                                //         });
                                //       },
                                //     )
                                // ),
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

                                    controller: demandController,
                                    enabled: false,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
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
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Select Tree",
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
                                ),
                                Container(
                                  width: double.infinity,
                                    padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                                    decoration: BoxDecoration(
                                        color:Color.fromRGBO(255, 254, 236, 1),
                                        border: Border.all(
                                            color: Color.fromRGBO(255, 254, 236, 1)
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    margin: EdgeInsets.only(top: 1),
                                    child: RaisedButton(
                                      elevation: 1.0,
                                      onPressed: (){
                                        // AlertDialog(
                                        //   title: Container(child: Padding(
                                        //     padding: const EdgeInsets.all(8.0),
                                        //     child: Text('Pick Item',style: TextStyle(color: Colors.white),),
                                        //   ),color: Colors.blueAccent,),
                                        //   content: setupAlertDialoadContainer(context),
                                        // );

                                        // if(dropdownvalue1=="Forest Trees"){
                                        //   showDialog(
                                        //     context: context,
                                        //     builder: (BuildContext context) => new FlutterExample(dropdownvalue1, ForestTrees, widget.year,
                                        //     widget.status, widget.date, widget.district, widget.block, widget.village, widget.farmer, widget.aadhar
                                        //         , widget.phone, widget.gender, widget.userID),
                                        //   );
                                        //
                                        // }else if(dropdownvalue1=="Plants"){
                                        //   showDialog(
                                        //     context: context,
                                        //     builder: (BuildContext context) => new FlutterExample(dropdownvalue1, FruitTrees, widget.year,
                                        //         widget.status, widget.date, widget.district, widget.block, widget.village, widget.farmer, widget.aadhar
                                        //         , widget.phone, widget.gender, widget.userID),
                                        //   );
                                        // }

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) => new FlutterExample(demandController.text, ForestTrees, widget.year,
                                              widget.status, widget.date, widget.district, widget.block, widget.village, widget.farmer, widget.aadhar
                                              , widget.phone, widget.gender, widget.userID),
                                        );

                                        },
                                      padding: EdgeInsets.all(15.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      color: Color.fromRGBO(181, 231, 77, 0.56),
                                      child: Text(
                                        'SELECT',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          letterSpacing: 1.5,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                ),
                                Container(
                                  height: 200,
                                  child: Scrollbar(
                                    child: ListView.builder(
                                      itemCount: FlutterExample.FarmerDemandMap.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        String key = FlutterExample.FarmerDemandMap.keys.elementAt(index);
                                        return new Column(
                                          children: <Widget>[
                                            new ListTile(
                                              title: new Text("$key"),
                                              subtitle: new Text("${FlutterExample.FarmerDemandMap[key]}"),
                                            ),
                                            new Divider(
                                              height: 2.0,
                                            ),
                                          ],
                                        );
                                      },
                                    )
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.symmetric(vertical: 25.0),
                                  width: double.infinity,
                                  child: RaisedButton(
                                    elevation: 1.0,
                                    onPressed: (){
                                      XFile? image;
                                      if(FlutterExample.FarmerDemandMap.toString() == "{}"){
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) => _buildPopupDialogforNon(context),
                                        );
                                      }
                                      else{
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerDemandPlants(widget.year,
                                            widget.status, widget.date, widget.district, widget.block, widget.village, widget.farmer, widget.aadhar
                                            , widget.phone, widget.gender, demandController.text, FlutterExample.FarmerDemandMap, null, widget.userID),

                                        ),);
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
                              ],
                            ))])])
        )
    );
  }

  Widget _buildPopupDialogforNon(BuildContext context) {
    return new AlertDialog(
      title: const Text('Trees/Plants not Selected', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Center(child:
        Text("Please select a tree or plant from the list"),)

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




  Widget setupAlertDialoadContainer(context) {
    print("in the func");
    return new Scaffold(
      
      body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.grey,
          height: 300.0, // Change as per your requirement
          width: 300.0, // Change as per your requirement
          child: ListView.builder(

            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('List Item $index'),
                )),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FlatButton(

            onPressed: (){
              Navigator.pop(context);
            },child: Text("Cancel"),),
        )
      ],
    ));
  }


  Widget _buildPopupDialog1(BuildContext context) {
    return new AlertDialog(
      title: const Text('Incorrect User ID or Password', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.grey,
            height: 300.0, // Change as per your requirement
            width: 300.0, // Change as per your requirement
            child: ListView.builder(

              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: new Text("item"),
                  trailing: SizedBox(
                    height: 50,
                    width: 150,
                  child: Row(
                    children: [
                      _itemCount!=0? new  IconButton(icon: new Icon(Icons.remove),onPressed: ()=>setState(()=>_itemCount--),):new Container(),
                      new Text(_itemCount.toString()),
                      new IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState(()=>_itemCount++))
                    ],
                  ),
                ));
              },
            ),
          ),
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

  @override
  void initState() {
    year=widget.year;
    demandController.text = "Forest Trees";
    print("inint");

    // print("Values from last page: ");
    // print(FlutterExample.FarmerDemandMap);
    // print("not map");
    // print(widget.userID);
    // print(widget.district);
    // print(widget.farmer);
    // print(widget.phone);
    // print(widget.aadhar);
    // print(widget.village);
    // print(widget.block);
    // print(widget.year);
    // print(widget.status);
    // print(widget.date);
    // print(widget.gender);
    //FlutterExample.FarmerDemandMap.clear();
  }
}


class ListTileItem extends StatefulWidget {
  String title;
  ListTileItem({required this.title});
  @override
  _ListTileItemState createState() => new _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 0;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //print(FlutterExample.FarmerDemandMap);
    if(FlutterExample.FarmerDemandMap.containsKey(widget.title)){
      print("object1234");
      print(FlutterExample.FarmerDemandMap[widget.title]==0);
      print(FlutterExample.FarmerDemandMap[widget.title]);
      _itemCount=FlutterExample.FarmerDemandMap[widget.title]!;
      if (FlutterExample.FarmerDemandMap[widget.title]==0){
        print("object123");
        FlutterExample.FarmerDemandMap.remove(widget.title);
        print(FlutterExample.FarmerDemandMap);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(widget.title),
      trailing: new SizedBox(
        height: 100,
        width: 120,
        child: Row(
        children: <Widget>[
          _itemCount!=0? new  IconButton(icon: new Icon(Icons.remove),onPressed: () {
            setState(() => _itemCount--);
            print(FlutterExample.FarmerDemandMap);
            FlutterExample.FarmerDemandMap[widget.title]=_itemCount;
            if(_itemCount==0){
              FlutterExample.FarmerDemandMap.remove(widget.title);
            }

          },):new Container(),
          new Text(_itemCount.toString()),
          new IconButton(icon: new Icon(Icons.add),onPressed: (){setState(()=>_itemCount++);
          print(FlutterExample.FarmerDemandMap);
          FlutterExample.FarmerDemandMap[widget.title]=_itemCount;
          })
        ],
      ),)
    );
  }




}

class FlutterExample extends StatelessWidget {

  String demandCat;
  var demandCatList;
  String year, status, date, district, block, village, farmer, aadhar, phone, gender, userID;

  FlutterExample(this.demandCat, this.demandCatList, this.year, this.status, this.date, this.district, this.block,
      this.village, this.farmer, this.aadhar, this.phone, this.gender, this.userID);
  static Map<String, int> FarmerDemandMap = {};


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select '+demandCat, style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),),
      content: new SizedBox(
        height: 300,
        width: 400,
        child:ListView(
        children: new List.generate(demandCatList.length, (i)=>new ListTileItem(
          title: demandCatList[i],
        )),
      ),),
        actions: <Widget>[
    new FlatButton(
    onPressed: () {
      print(FarmerDemandMap);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerDemand(
          year,
          status, date, district, block, village, farmer, aadhar, phone, gender, userID
      ),),);
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) => FarmerDemand()),
      //       (Route<dynamic> route) => false,
      // );
    },
    textColor: Theme.of(context).primaryColor,
    child: const Text('Close'),
    ),
    ],
    );
  }

}



