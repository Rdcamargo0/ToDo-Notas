import 'package:flutter/material.dart';

class menu extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Container(
      color: Colors.yellow,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(

            accountName:  Text(''),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://cdn.icon-icons.com/icons2/1161/PNG/512/1487716857-user_81635.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration (
                color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
           ],
        ),
    ),
 );
    
  }
}