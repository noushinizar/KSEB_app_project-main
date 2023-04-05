import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kseb_project/API_service/api.dart';
class user_chat extends StatefulWidget {
  const user_chat({Key? key}) : super(key: key);

  @override
  State<user_chat> createState() => _user_chatState();
}

class _user_chatState extends State<user_chat> {
  @override
    List chat=[];
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
          chat= items;
        });


      }else{
        setState(() {
          chat=[];
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen[100],
          title: Text("Chat",
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
            itemCount: chat.length,
            itemBuilder: (context, index){
              return Card(
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      /*onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            View_complaint(
                              comptitle: complaints[0]['complaint_title'],
                              location: complaints[0]['location'],
                              Compdes: complaints[0]['description'],)));
                      },*/
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(chat[0]['user_id'],
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
                           // Viewcomplaints();

                          },
                          child: Text("view"),)),

                  ],
                ),
              );
            }),

      );
    }
  }

