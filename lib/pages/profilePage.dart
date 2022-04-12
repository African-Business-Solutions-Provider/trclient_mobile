import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
          child: Text('Profile', style: TextStyle(color: Colors.green),),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.transparent,
      ),
      body: profileView(),
    );
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
//        Padding(
//          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
////              Container(
////                height: 50,
////                width: 50,
////                child: FlatButton(
////                  child: Icon(
////                    Icons.arrow_back_ios,
////                    size: 24,
////                    color: Colors.black54,
////                  ),
////                  onPressed: () => {
////
////                  },
////                ),
////                decoration: BoxDecoration(
////                  border: Border.all(color: Colors.black54),
////                  borderRadius: BorderRadius.all(Radius.circular(10))),
////              ),
//              Text(
//                'Profiles details',
//                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//              ),
//              Container(height: 24, width: 24)
//            ],
//          ),
//        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/dave.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ))
            ],
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Name',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Email',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Phone',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Physical Address',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40,
                    width: 100,
                    child: Align(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        )),
                  ),
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
