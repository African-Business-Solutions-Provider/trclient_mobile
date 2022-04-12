import 'package:absp_mobile/pages/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = "/settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.amber,
                  child: ListTile(
                    onTap: () => {
                      Navigator.pushNamed(context, ProfilePage.routeName)
                    },
                    title: Text('Dave Budah',
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      letterSpacing: 2),),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://twitter.com/hackervist"),
                    ),
                    trailing: Icon(Icons.edit, color: Colors.white,),
                  ),
                ),
                const SizedBox(height: 10,),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(32, 8, 32, 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.lock_outline, color: Colors.green,),
                        title: Text('Change Password', style: TextStyle(fontFamily: 'Montserrat', letterSpacing: 1),),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () => {},
                      ),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(Icons.add_location, color: Colors.green,),
                        title: Text('Turn On Location',style: TextStyle(fontFamily: 'Montserrat', letterSpacing: 1)),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () => {},
                      ),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(Icons.delete, color: Colors.green,),
                        title: Text('Delete Account', style: TextStyle(fontFamily: 'Montserrat', letterSpacing: 1)),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () => {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text('Notification Settings', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  letterSpacing: 1,
                  fontFamily: 'Montserrat'
                ),),
                const SizedBox(height: 10),
                SwitchListTile(
                  dense: true,
                  activeColor: Colors.orange,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text('Receive Notifications',style: TextStyle(fontFamily: 'Montserrat', letterSpacing: 1)),
                  onChanged: (val){},
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  dense: true,
                  activeColor: Colors.orange,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text('Notify on Approval',style: TextStyle(fontFamily: 'Montserrat', letterSpacing: 1)),
                  onChanged: (val){},
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  dense: true,
                  activeColor: Colors.orange,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text('Notify on Reject',style: TextStyle(fontFamily: 'Montserrat', letterSpacing: 1)),
                  onChanged: (val){},
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  dense: true,
                  activeColor: Colors.orange,
                  contentPadding: const EdgeInsets.all(0),
                  value: false,
                  title: Text('Use Dark Theme', style: TextStyle(fontFamily: 'Montserrat', letterSpacing: 1)),
                  onChanged: (val){},
                ),
              ],
            ),
          ),
        ],
      )
    );
  }

  Container _buildDivider() {
    return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.shade300,
                );
  }
}
