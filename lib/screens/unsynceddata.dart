

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'homescreen.dart';

class UnsyncedData extends StatefulWidget {

  String valueBlock1, valueVillage1, valueDistrict1, userID;
  var itemsBlock1, itmesVillage1, itemsDIstrict1,mapList;

  UnsyncedData(
      this.valueBlock1,
      this.valueVillage1,
      this.valueDistrict1,
      this.itemsBlock1,
      this.itmesVillage1,
      this.itemsDIstrict1,
      this.userID,this.mapList);

  @override
  State<UnsyncedData> createState() => _UnsyncedDataState();
}

class _UnsyncedDataState extends State<UnsyncedData> {

  Box? boxSynced;
  late Box box3;

  var mappedValues;

  Map<String,dynamic> map={};
  List list = [];

  bool val = false;

  @override
  void initState() {
    createBox();

    print(widget.mapList);
    print(widget.mapList.length);



    mappedValues = widget.mapList.map((m) => m).toList();

    print(mappedValues);

    for(int i=0;i<mappedValues.length-1;i++){
      print(mappedValues[i]);
      print(mappedValues[i]['status']);
      print(mappedValues[i]['year']);
      print(mappedValues[i]['farmer']);
      print(mappedValues[i]['village']);
      print(mappedValues[i]['farmer_demand_map']);
      mappedValues[i].forEach((index, element) {
        print("----");
        print(index);
        print(element);
      });
    }



    // mappedValues.forEach((number) {
    //   number.forEach((index, element) {
    //     print("----");
    //     print(index);
    //     print(element);
    //   });
    // });

    //print(widget.mapList.substring( 1, widget.mapList.length() - 1 ));

    // for (var i = 0; i < widget.mapList.length; i++) {
    //   print(widget.mapList.getAt(i));
    //   print("index: " + i.toString());
    //   print(widget.mapList.getAt(i)['status'].toString());
    //   print(widget.mapList.getAt(i)['tree_type'].toString());
    //   print(widget.mapList.getAt(i)['selected_tree'].toString());
    //   print(widget.mapList.getAt(i)['qty'].toString());
    //   widget.mapList.getAt(i).forEach((index, element) {
    //     print("----");
    //     print(index);
    //     print(element);
    //   });
    // }

  }

  createBox() async {
    boxSynced = await Hive.openBox("boxsynced");
    box3 = await Hive.openBox("demanddata");
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 254, 236, 1),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Unsynced Form",
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
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserType(
                            //     widget.valueBlock1, widget.valueVillage1, widget.valueDistrict1, widget.itemsBlock1, widget.itmesVillage1, widget.valueDistrict1, widget.userID
                            // ),),);

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserType(
                                widget.valueBlock1, widget.valueVillage1, widget.valueDistrict1, widget.itemsBlock1, widget.itmesVillage1, widget.valueDistrict1, widget.userID
                            ),),);
                          },
                        ),
                      ],mainAxisAlignment: MainAxisAlignment.spaceBetween,),

                    Container(
                        child: mappedValues.length-1==-1 ?
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Text(
                            "All data have been Synced",
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
                        ) : Container()

                    ),


                    Container(
                      child: GridView.count(
                        physics: ScrollPhysics(),
                        childAspectRatio: (1 / 0.65),
                        shrinkWrap: true,
                        crossAxisCount: 1,
                        children: mappedValues.length-1==-1?
                            []:
                        List.generate(
                          //box2.get('isLogged',defaultValue: false)?MyPhone(title: "phone"):Verify(),
                            mappedValues.length-1,//this is the total number of cards
                                (i){
                              return Container(

                                child: Card(
                                    color: Color.fromRGBO(211, 93, 93, 1.0),
                                    child:Container(

                                      padding: EdgeInsets.all(16),
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: mappedValues[i]['status']+"\n\n",
                                                  style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 17),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            //mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: mappedValues[i]['farmer'].toUpperCase()+"\n\n",
                                                              style: TextStyle(color: Colors.white, fontSize: 18),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],))
                                            ],
                                          ),
                                          // RichText(
                                          //   text: TextSpan(
                                          //     children: <TextSpan>[
                                          //       TextSpan(
                                          //         text: "Year: ",
                                          //         style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
                                          //       ),
                                          //       TextSpan(
                                          //         text: mappedValues[i]['year'],
                                          //         style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 15),
                                          //       ),
                                          //
                                          //     ],
                                          //   ),
                                          // ),
                                          //SizedBox(height: 5,),
                                          Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    flex: 2,
                                                    child:Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [RichText(
                                            text: TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: "Village: ",
                                                  style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
                                                ),
                                                TextSpan(
                                                  text: mappedValues[i]['village'],
                                                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 15),
                                                ),

                                              ],
                                            ),
                                          ),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: "Year: ",
                                                              style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
                                                            ),
                                                            TextSpan(
                                                              text: mappedValues[i]['year'],
                                                              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 15),
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                    ],)),
                                                
                                                Expanded(

                                                  flex: 1,
                                                    child:Container(
                                                    alignment: Alignment.topCenter,
                                                    child: ElevatedButton(
                                                      onPressed: () {

                                                        print(i);

                                                        for (var i = 0; i < box3.length-1; i++) {
                                                          print(box3.getAt(i));
                                                          print("index: " + i.toString());
                                                        }


                                                        box3.deleteAt(i);
                                                        print(box3);

                                                        for (var i = 0; i < box3.length-1; i++) {
                                                          print(box3.getAt(i));
                                                          print("index: " + i.toString());
                                                        }

                                                        setState(() {
                                                          mappedValues.removeAt(i);
                                                        });

                                                      },
                                                      child: Icon(Icons.delete,color: Colors.black54,),
                                                      style: ButtonStyle(
                                                        shape: MaterialStateProperty.all(CircleBorder()),
                                                        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                                                        backgroundColor: MaterialStateProperty.all(Colors.amberAccent), // <-- Button color
                                                        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                                                          if (states.contains(MaterialState.pressed)) return Colors.red; // <-- Splash color
                                                        }),
                                                      ),
                                                    ))
                                                )

                                                
                                              ]),
                                          //SizedBox(height: 2,)
                                        ],
                                      ),
                                    )
                                  //Text(result["response"][index]["Name"]),
                                ),
                               );
                            }
                        ),
                      ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
