import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kseb_project/API_service/api.dart';
import 'package:kseb_project/kseb/View_complaints.dart';
class manage_comp extends StatefulWidget {
  const manage_comp({Key? key}) : super(key: key);

  @override
  State<manage_comp> createState() => _manage_compState();
}

class _manage_compState extends State<manage_comp> {


List complaints=[];
@override
void initState() {
  // TODO: implement initState
  super.initState();
 Viewcomplaints();
}
@override

  Viewcomplaints() async{
    var res = await Api().getData('complaint/view');
    print(res);
    if(res.statusCode==200){
      var items = jsonDecode(res.body);
      print(items);
      setState(() {
        complaints= items;
      });


    }else{
      setState(() {
        complaints=[];
      });
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[100],
        title: Text("Manage complaints",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey, Colors.green]),
          ),
        ),
      ),
      body:ListView.builder(
          shrinkWrap: true,
          itemCount: complaints.length,
          itemBuilder: (context, index){
            return Card(
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          View_complaint(
                            comptitle: complaints[index]['complaint_title'],
                            location: complaints[index]['location'],
                            Compdes: complaints[index]['description'],)));
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(complaints[0]['user_id'],
                              style: TextStyle(
                                fontSize: 18,
                              ),),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: (){
                         //Viewcomplaints();

                        },
                        child: Text("view"),)),

                ],
              ),
            );
          }),

    );
  }
}


