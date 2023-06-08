import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Home()
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Local Json"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder( //used for loading local json file
            future: DefaultAssetBundle.of(context).loadString("load_json/person.json"),
            builder: (context,snapshot){
                //decode our json
              var Mydata=json.decode(snapshot.data.toString());
              return ListView.builder(itemBuilder: (BuildContext,int index){
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Name: "+Mydata[index]['Name']),
                      Text("Age: "+Mydata[index]['age']),
                      Text("Height: "+Mydata[index]['height']),
                      Text("Gender: "+Mydata[index]['gender']),
                    ],
                  ),
                );
              },
              itemCount:Mydata == null ? 0:Mydata.length ,
              );
            },
          ),
        ),
      ),
    );
  }
}
