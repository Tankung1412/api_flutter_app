import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetTodos extends StatefulWidget {
  const GetTodos({super.key});

  @override
  State<GetTodos> createState() => _GetTodosState();
}

class _GetTodosState extends State<GetTodos> {
  Future<Map<String,dynamic>> gettodo(int id) async{
    var url = "https://jsonplaceholder.typicode.com/todos/$id";
    var respones = await http.get(Uri.parse(url));

    return jsonDecode(respones.body) as Map<String,dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}