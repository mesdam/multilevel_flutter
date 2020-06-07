import 'package:flutter/material.dart';

import './detail_akun.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Beranda'),
              ]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Click  search');
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications_active),
              onPressed: () {
                print('Click  start');
              },
            ),
          ],
        ),
//widget  Drawer
        drawer: new Drawer(
//menggunakan  listView  agar  drawer  dapat  melebihi  width  devices
          child: new ListView(
            children: <Widget>[
//Drawer  Header  diisi  dengan  informasi  akun
              new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => DetailAkun(
                      accountName: "Ni Kadek Mesi Damayanti",
                      accountEmail: "mesi@undiksha.ac.id",
                      backgroundImage: "foto.jpg",
                    ),
                  ));
                },
                child: UserAccountsDrawerHeader(
                  accountName: new Text("Ni Kadek Mesi Damayanti"),
                  accountEmail: new Text("mesi@undiksha.ac.id"),
                  currentAccountPicture: new GestureDetector(
                    onTap: () {},
                    child: new CircleAvatar(
                      backgroundImage: AssetImage('assets/appimages/foto.jpg'),
                    ),
                  ),
//memberi  background  pada  Drawer  Header
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/appimages/bg.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
//Menu  Drawer
              new ListTile(
                title: new Text('Notifications'),
                trailing: new Icon(Icons.notifications_none),
              ),
              new ListTile(
                title: new Text('Wishlist'),
                trailing: new Icon(Icons.bookmark_border),
              ),
              new ListTile(
                title: new Text('Akun'),
                trailing: new Icon(Icons.verified_user),
              ),
//Divider  Menu
              Divider(
                height: 2,
              ),

              new ListTile(
                title: new Text('Setting'),
                trailing: new Icon(Icons.settings),
              ),
            ],
          ),
        ));
  }
}
