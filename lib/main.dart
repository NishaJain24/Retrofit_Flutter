import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_flutter/data.dart';
import 'apirequest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.pink,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Retrofit Implementation - Flutter"),
      ),
      body: pressed ? _buildBody(context):Center(
        child: RaisedButton(child: Text("Fetch Users",style: TextStyle(color: Colors.white,fontSize: 18),),color: Colors.pink,
            onPressed: () => {setState(() {
              pressed = true;

            })}),
      ),
    );
  }
}

FutureBuilder<ResponseData> _buildBody(BuildContext context) {
  final client = ApiRequest(Dio(BaseOptions(contentType: "application/json")),baseUrl: 'https://gorest.co.in/public-api/');
  return FutureBuilder<ResponseData>(
    future: client.getUsers(),
    builder: (context, snapshot) {
      print('snapshot.error ${snapshot.error}');
      if (snapshot.connectionState == ConnectionState.done) {

        final  posts = snapshot.data;
        print(posts);
        if(posts!=null)
        {
          return _buildPosts(context, posts);
        }else
        {
          return Center(
            child: Container(),
          );
        }

      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

Widget _buildPosts(BuildContext context, ResponseData posts) {
  return
    ListView.builder(itemBuilder: (context,index){
      return Card(
        child: ListTile(

          leading: Icon(Icons.person_pin,color: Colors.pink,size: 50,),
          title: Text(posts.data[index]['name'],style: TextStyle(fontSize: 20),),
          subtitle: Text(posts.data[index]['email']),
        ),
      );
    },itemCount: posts.data.length,
    );

}
