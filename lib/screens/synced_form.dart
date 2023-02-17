import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'homescreen.dart';

class SyncedForm extends StatefulWidget {

  String valueBlock1, valueVillage1, valueDistrict1, userID;
  var  itemsBlock1, itmesVillage1, itemsDIstrict1,mapList;

  SyncedForm(
      this.valueBlock1,
      this.valueVillage1,
      this.valueDistrict1,
      this.itemsBlock1,
      this.itmesVillage1,
      this.itemsDIstrict1,
      this.userID,this.mapList);

  @override
  State<SyncedForm> createState() => _SyncedFormState();
}

class _SyncedFormState extends State<SyncedForm> {



  Box? boxSynced;
  Box? box3;

  var mappedValues;

  double wt=1,ht=0.65;


  @override
  void initState() {
    createBox();
    mappedValues=widget.mapList;

    for(int i=0;i<mappedValues[0].length;i++){
      print("priu"+mappedValues[0][i].toString());
    }
  }

  createBox() async {
    print("createbox");
    boxSynced = await Hive.openBox("boxsynced");
    box3 = await Hive.openBox("farmer_demand");
    if(boxSynced!=null){
      print("1234567NotEmpty");
      print(boxSynced?.length);
    }
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
                          "Recently \nSynced Form12",
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
                          },
                        ),
                      ],mainAxisAlignment: MainAxisAlignment.spaceBetween,),

                    Container(
                      child: mappedValues.length-1==-1 ?
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Text(
                          "No Data have been Synced",
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


                    SizedBox(height: 10,),

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
                                        color: Colors.blueGrey,
                                        child: Container(

                                          padding: EdgeInsets.all(16),
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: mappedValues[i]['status'] +
                                                          "\n\n",
                                                      style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(0.7),
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                //mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                  text: mappedValues[i]['farmer']
                                                                      .toUpperCase() +
                                                                      "\n\n",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize: 18),
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
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .start,
                                                          children: [RichText(
                                                            text: TextSpan(
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                  text: "Village: ",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white
                                                                          .withOpacity(
                                                                          0.5),
                                                                      fontSize: 15),
                                                                ),
                                                                TextSpan(
                                                                  text: mappedValues[i]['village'],
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white
                                                                          .withOpacity(
                                                                          0.8),
                                                                      fontSize: 15),
                                                                ),

                                                              ],
                                                            ),
                                                          ),
                                                            RichText(
                                                              text: TextSpan(
                                                                children: <
                                                                    TextSpan>[
                                                                  TextSpan(
                                                                    text: "Year: ",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white
                                                                            .withOpacity(
                                                                            0.5),
                                                                        fontSize: 15),
                                                                  ),
                                                                  TextSpan(
                                                                    text: mappedValues[i]['year'],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white
                                                                            .withOpacity(
                                                                            0.8),
                                                                        fontSize: 15),
                                                                  ),

                                                                ],
                                                              ),
                                                            ),
                                                          ],)),


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
