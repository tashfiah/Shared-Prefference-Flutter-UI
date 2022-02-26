import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _count = 0;
  final datacount = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (datacount.read('count') != null) {
      _count = datacount.read('count');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Shared Preferences'),
      ),
      body: Center(
        child: Container(
          child: Text(
            "Button tapped ${datacount.read('count')} times",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
            datacount.write("count", _count);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
