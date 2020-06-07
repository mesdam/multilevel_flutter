import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onistore_2/AdminPage.dart';
import './main.dart';

class EditData extends StatefulWidget {
  List list;
  int index;
  EditData({this.index, this.list});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerNama;
  TextEditingController controllerKeterangan;
  TextEditingController controllerTanggal;
  TextEditingController controllerHarga;
  TextEditingController controllerAlamat;

  void editData() {
    var url = "http://192.168.43.7:8080/oniflorist_store/editdata.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "nama": controllerNama.text,
      "keterangan": controllerKeterangan.text,
      "tanggal": controllerTanggal.text,
      "harga": controllerHarga.text,
      "alamat": controllerAlamat.text,
    });
  }

  @override
  void initState() {
    controllerNama =
        new TextEditingController(text: widget.list[widget.index]['nama']);
    controllerKeterangan = new TextEditingController(
        text: widget.list[widget.index]['keterangan']);
    controllerTanggal =
        new TextEditingController(text: widget.list[widget.index]['tanggal']);
    controllerHarga =
        new TextEditingController(text: widget.list[widget.index]['harga']);
    controllerAlamat =
        new TextEditingController(text: widget.list[widget.index]['alamat']);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('EDIT DATA'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: controllerNama,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: controllerKeterangan,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Keterangan",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: controllerTanggal,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Tanggal",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: controllerHarga,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Harga",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: controllerAlamat,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Alamat",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                ),
                onChanged: (value) {},
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              child: new Text("EDIT"),
              color: Colors.blueAccent,
              onPressed: () {
                editData();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new AdminPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
