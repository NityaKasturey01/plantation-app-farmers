
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:plantationapp/screens/synced_form.dart';
import 'package:plantationapp/screens/unsynceddata.dart';

import 'data_sync.dart';
import 'farmer_reg.dart';
import 'login_screen.dart';


class UserType extends StatefulWidget {


  String valueBlock1, valueVillage1, valueDistrict1, userID;
  var  itemsBlock1, itmesVillage1, itemsDIstrict1;

  UserType(
      this.valueBlock1,
      this.valueVillage1,
      this.valueDistrict1,
      this.itemsBlock1,
      this.itmesVillage1,
      this.itemsDIstrict1,
      this.userID);


  @override
  State<UserType> createState() => _UserTypeState();

}

class _UserTypeState extends State<UserType> {

  Box? box2;
  late Box box3;
  late Box box4;


  @override
  void initState() {
    createBox();
  }

  void createBox()async{
    box2 = await Hive.openBox("logindata");
    box3 = await Hive.openBox("demanddata");
    box4 = await Hive.openBox('datasynced');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 255, 241, 1.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset("assets/images/logo1.png", width: 150),
                    SizedBox(height: 20,),
                    Text('Welcome', style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0
                    ),),
                  ],
                )
            ),
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(

                    children: [
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 2.0,
                          onPressed: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FarmerRegistration(
                                widget.valueBlock1, widget.valueVillage1, widget.valueDistrict1, widget.itemsBlock1, widget.valueVillage1, widget.itemsDIstrict1, widget.userID
                            ),),);
                          },
                          padding: EdgeInsets.all(18.0),

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: Color.fromRGBO(93, 43, 14, 0.5), width: 2)
                          ),
                          color: Colors.white,
                          child: Text(
                            'New Form',
                            style: TextStyle(
                              color: Color.fromRGBO(93, 43, 14, 1),
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 2.0,
                          onPressed: ()
                          {

                            List box4Val=[];

                            if(box4.get("box3").toString()==null.toString()){
                              box4Val = [];
                          }else{
                              print(box4.get("box3").toString());
                              print("GETTTTTTTDATAA12");
                              print(box4.get("box3").length);
                              print("values inside the box");
                              print(box4.values);

                              for (var i = 0; i < box4.get("box3").length-1; i++) {
                          if(box4.get("box3")[i] is String){
                            print("opop"+box4.get("box3")[i].toString());
                            print("o");
                          }else{
                            print("pri"+box4.get("box3")[i].toString());
                            //box4Val=box4.get("box3");
                            box4Val.add(box4.get("box3")[i]);
                          }

                              }
                            }

                            Navigator.push(context, MaterialPageRoute(builder: (context) => SyncedForm(
                                widget.valueBlock1,
                                widget.valueVillage1, widget.valueDistrict1, widget.itemsBlock1, widget.valueVillage1, widget.itemsDIstrict1,
                                widget.userID,box4Val
                            ),),);
                          },
                          padding: EdgeInsets.all(18.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: Color.fromRGBO(93, 43, 14, 0.5), width: 2)
                          ),
                          color: Colors.white,
                          child: Text(
                            'Synced Form',
                            style: TextStyle(
                              color: Color.fromRGBO(93, 43, 14, 1),
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 2.0,
                          onPressed: ()
                          {
                            print(box3.length);
                            print("values inside the box");
                            print(box3.values);
                            // for (var i = 0; i < box3.length-1; i++) {
                            //   print(box3.getAt(i));
                            //   print("index: " + i.toString());
                            //   print(box3.getAt(i)['status'].toString());
                            //   print(box3.getAt(i)['tree_type'].toString());
                            //   print(box3.getAt(i)['selected_tree'].toString());
                            //   print(box3.getAt(i)['qty'].toString());
                            //   box3.getAt(i).forEach((index, element) {
                            //     print("----");
                            //     print(index);
                            //     print(element);
                            //   });
                            // }

                            Navigator.push(context, MaterialPageRoute(builder: (context) => UnsyncedData(widget.valueBlock1,
                                widget.valueVillage1, widget.valueDistrict1, widget.itemsBlock1, widget.valueVillage1, widget.itemsDIstrict1,
                                widget.userID,box3.values)),);
                          },
                          padding: EdgeInsets.all(18.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: Color.fromRGBO(93, 43, 14, 0.5), width: 2)
                          ),
                          color: Colors.white,
                          child: Text(
                            'Unsynced Form',
                            style: TextStyle(
                              color: Color.fromRGBO(93, 43, 14, 1),
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 2.0,
                          onPressed: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DataSyncDemand(box3.values.first)),);
                          },
                          padding: EdgeInsets.all(18.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: Color.fromRGBO(93, 43, 14, 0.5), width: 2)
                          ),
                          color: Colors.white,
                          child: Text(
                            'Sync Data',
                            style: TextStyle(
                              color: Color.fromRGBO(93, 43, 14, 1),
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 2.0,
                          onPressed: ()
                          {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => ,),);

                            print("boxx hello");
                            print(box2?.get("isLogged"));
                            box2?.put('isLogged',false);
                            print("box after");
                            print(box2?.get("isLogged"));
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>LoginScreen()));
                            },
                          padding: EdgeInsets.all(18.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: Colors.black26, width: 2)
                          ),
                          color: Colors.white70,
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Color.fromRGBO(93, 43, 14, 1),
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
