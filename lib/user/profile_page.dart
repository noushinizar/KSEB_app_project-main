import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    // boxShadow: [
                    //   new BoxShadow(blurRadius: 40.0)
                    // ],
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 200.0)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 145,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 43,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 90,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Name',style: TextStyle(color: Colors.black,fontSize: 18),),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text('7015459899',style: TextStyle(color: Colors.black,fontSize: 18),),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('name@gmail.com',style: TextStyle(color: Colors.black,fontSize: 18),),
            ),
            Divider(),
           ListTile(
             leading: Icon(Icons.location_city),
             title: TextField(
               decoration: InputDecoration( border: InputBorder.none,
                 hintText: 'Enter your city'
               ),
             ),
           ),
            Divider(),
            ListTile(
              leading: Icon(Icons.pin),
              title: TextField(
                decoration: InputDecoration( border: InputBorder.none,
                    hintText: 'Enter your PIN'
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 100,right: 100),
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green[100]),
                  child: Center(child: Text('Save',style: TextStyle(color: Colors.black,fontSize: 20),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
