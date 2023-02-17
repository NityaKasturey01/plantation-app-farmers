import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:plantationapp/screens/distribution_farmer_consent.dart';
import 'package:plantationapp/screens/login_screen.dart';
import 'package:plantationapp/screens/surveyor_consent.dart';
import 'package:signature/signature.dart';

class FarmerDistribution extends StatefulWidget {
  //const FarmerDistribution({Key? key}) : super(key: key);

  String Farmer;
  int fid;

  FarmerDistribution(this.Farmer, this.fid);

  @override
  State<FarmerDistribution> createState() => _FarmerDistributionState();
}

class _FarmerDistributionState extends State<FarmerDistribution> {

  bool agree = false;
  final TextEditingController demandTypeController = new TextEditingController();

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  Box? box1;
  Box? box2;

  List selected_tree = [];
  List qty = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createBox();
    print("inside");
    print(box1?.get("demandFID"));
    print(box1?.get("demandFID"));
    setState(() {
      print("instate");

      box1?.get("demandFID").asMap().forEach((index, element) {
        print(element);
        print(widget.fid);
        print("nect1");
        print(box1?.get("regFID")[index]);
        if(box1?.get("demandFID")[index].toString() == widget.fid.toString() && box1?.get("demandUserID")[index].toString() == box2?.get("email")){
          print("index"+index.toString());
          demandTypeController.text = demandTypeController.text+box1?.get("demandFarmer")[0];
          // phoneController.text = box1?.get("regPhone")[index];
          // dropdownvalue2 = box1?.get("regGender")[index];
          // print(box1?.get("regPhone")[index+1]);
          // showPOP = false;
        }
      });
    });
  }

  void createBox()async{
    box1 = await Hive.openBox('dropdowndata');
    box2 = await Hive.openBox("logindata");
    print(box1?.get("demandFID"));



    box1?.get("demandFID").asMap().forEach((index, element) {
      print(element);
      print(widget.fid);
      print("nect1");
      print(box1?.get("demandUserID")[index].toString());
      print(box2?.get("email"));
      //print(box1?.get("regFID")[index]);

      print(element.toString() == widget.fid.toString());
      print(box1?.get("demandUserID")[index].toString() == box2?.get("email"));

      if(element.toString() == widget.fid.toString() ){//&& box1?.get("demandUserID")[index].toString() == box2?.get("email").toString()){

        print("index"+index.toString());
        if(demandTypeController.text.contains("Trees") || demandTypeController.text.contains("Forest")){
          demandTypeController.text = demandTypeController.text;
        }else{
          demandTypeController.text = demandTypeController.text+box1?.get("demandFarmer")[index];
        }

        //selected_tree.add(box1?.get("demandList")[index].toString());
        //qty.add(box1?.get("demandqty")[index].toString());

        setState(() {
          selected_tree.add(box1?.get("demandList")[index].toString());
          qty.add(box1?.get("demandqty")[index].toString());
        });
        // phoneController.text = box1?.get("regPhone")[index];
        // dropdownvalue2 = box1?.get("regGender")[index];
        // print(box1?.get("regPhone")[index+1]);
        // showPOP = false;
      }

      print("list l1 l2");
      print(box1?.get("demandList"));
      print(box1?.get("demandqty"));
      print(selected_tree);
      print(qty);
    });
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
                        SizedBox(height: 20,),
                        Text(
                          "Farmer's Distribution",
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
                        SizedBox(height: 20,),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
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
                                    controller: demandTypeController,
                                    readOnly: true,
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Tree/Plant',
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
                                Container(
                                  padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                                  decoration: BoxDecoration(
                                      color:Colors.white,
                                      border: Border.all(
                                          color: Colors.black54
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  margin: EdgeInsets.only(top: 1),
                                  child: Container(
                                    height: 200,
                                    child: Scrollbar(
                                        child: ListView.builder(
                                          itemCount: selected_tree.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            //String key = FlutterExample.FarmerDemandMap.keys.elementAt(index);
                                            return new Column(
                                              children: <Widget>[
                                                new ListTile(
                                                  title: new Text(selected_tree[index]+": "+qty[index]),
                                                  //subtitle: new Text(qty[index]),
                                                ),

                                              ],
                                            );
                                          },
                                        )
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20,),

                                Row(
                                  children: [
                                    Material(
                                      child: Checkbox(

                                        value: agree,
                                        onChanged: (value) {
                                          setState(() {
                                            agree = value ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                    const Text(
                                      'I have Recieved the plants/tree as \nper demand',
                                        maxLines: 6,
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis
                                    )
                                  ],
                                ),

                                // SizedBox(height: 20,),
                                // Container(
                                //   child: Text(
                                //     "Farmers's Signature",
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
                                //       color:Color.fromRGBO(215, 222, 199, 1.0),
                                //       border: Border.all(
                                //           color: Color.fromRGBO(215, 222, 199, 1.0)
                                //       ),
                                //       borderRadius: BorderRadius.all(Radius.circular(10))
                                //   ),
                                //   margin: EdgeInsets.only(top: 1),
                                //   child: Signature(
                                //     controller: _controller,
                                //     height: 130,
                                //     backgroundColor: Colors.white,
                                //   ),
                                // ),
                                // Row(
                                //   children: [
                                //     Container(
                                //       padding: EdgeInsets.only(left: 6, top: 4, right: 6, bottom: 2),
                                //       margin: EdgeInsets.only(top: 1),
                                //       alignment: Alignment.center,
                                //       child: IconButton(
                                //         icon: const Icon(Icons.redo),
                                //         color: Colors.blue,
                                //         onPressed: () {
                                //           setState(() => _controller.clear());
                                //         },
                                //       ),
                                //     ),
                                //     Container(
                                //       margin: EdgeInsets.only(top: 1),
                                //       alignment: Alignment.center,
                                //       child: IconButton(
                                //         icon: const Icon(Icons.check_circle_rounded),
                                //         color: Colors.blue,
                                //         onPressed: () => exportImage(context),
                                //       ),
                                //     ),
                                //
                                //   ],
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                // ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.symmetric(vertical: 25.0),
                                  width: double.infinity,
                                  child: RaisedButton(
                                    elevation: 1.0,
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerDistributionFConsent(widget.Farmer, widget.fid, agree.toString(), null),),);
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
                            ))])])));}}
