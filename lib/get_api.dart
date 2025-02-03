import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetApi extends StatefulWidget {
  const GetApi({super.key});

  @override
  State<GetApi> createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  Future<Map<String,dynamic>> gettodo() async{
    var url = "https://jsonplaceholder.typicode.com/todos/5";
    var respones = await http.get(Uri.parse(url));

    return jsonDecode(respones.body) as Map<String,dynamic>;
  }

  Future<Map<String,dynamic>>? todo;
  var text = '' ;

  @override
  Widget build(BuildContext context) {
    todo = gettodo();
    todo?.then((value){
      setState(() {
        text = 'Title: ${value["title"]}\n';
        text += 'Complete: ${value["completed"]}';
        //call = false;
      });
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Restful API'),),

      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 20,
        ),
        child: Text(text),
      ),
    );
  }
}