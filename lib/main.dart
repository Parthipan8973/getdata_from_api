import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getdata_from_api/todos/user.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
      theme: ThemeData(primaryColor: Colors.green),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<User> listuser = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('welcome to my app ')),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(listuser[index].toString() ?? 'user name'),
                    leading: Icon(Icons.co_present),
                  ),
                  Divider()
                ],
              );
            },
            itemCount: listuser.length,
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              List<User> data = await getUser();
              setState(() {
                listuser = data;
              });
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Invalid data come ')));
            }
            getUser();
          },
          child: Icon(Icons.add)),
    );
  }

  Future<List<User>> getUser() async {
    String url = 'https://jsonplaceholder.typicode.com/users';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Invalid data');
    }
    String responseBody = response.body;
    List listMap = jsonDecode(responseBody);
    listuser = listMap.map(
      (e) {
        return User.fromJson(e);
      },
    ).toList();
    // print(list);
    return listuser;
  }
}
