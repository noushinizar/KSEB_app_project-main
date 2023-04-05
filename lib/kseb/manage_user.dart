import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kseb_project/API_service/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
class manage_user extends StatefulWidget {
  const manage_user({Key? key}) : super(key: key);

  @override
  State<manage_user> createState() => _manage_userState();
}

class _manage_userState extends State<manage_user> {
  late SharedPreferences local;

 List Users = [];
  String login_id ="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override

  fetchData()async {
    local = await SharedPreferences.getInstance();
    login_id = local.getString('login_id')??'';
    print(login_id);
    var res = await Api().getData("admin/view-user");
    if(res.statusCode==200){
      var items = jsonDecode(res.body)['data'];
      print(items);
      setState(() {
        Users = items;
      });
    }else{
      setState(() {
        Users = [];
      });
    }
  }

  deleteData(String _id) async{
    setState(() {
      var isloading = true;
    });
  String log_id= login_id.replaceAll('"', '');
  print(log_id);
  var res= await Api().getData( "kseb/delete-user/"+log_id);
  var body = jsonDecode(res.body);

  if(body['success']== true){
    print(body);
   Fluttertoast.showToast(
       msg: body['message'].toString(),
   backgroundColor: Colors.grey,
   );
   Navigator.push(context, MaterialPageRoute(builder: (context)=>manage_user()));
  }else
    {
      Fluttertoast.showToast(
          msg: body['message'].toString(),
    backgroundColor: Colors.grey,
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[100],
        title: Text("Manage Users",
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
          itemCount: Users.length,
          itemBuilder: (context, index){
            return Card(
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(Users[index]['username'],
                        style: TextStyle(
                          fontSize: 18,
                        ),),
                        Text(Users[index]['phone'],
                          style: TextStyle(
                            fontSize: 18,
                          ),),
                        Text(Users[index]['address'],
                          style: TextStyle(
                            fontSize: 18,
                          ),),
                      ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      onPressed: ()async{
                       deleteData(login_id);
                       print("log$login_id");
            },
                      child: Text("Remove"),)),


                ],
              ),
            );
          }),

      );
  }
}
