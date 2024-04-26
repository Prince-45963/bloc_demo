import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_demo/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {

  Future<List<PostModel>> getPostList() async{
    try {
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if(response.statusCode==200){
        final body = json.decode(response.body) as List;

        return body.map((e){

         return PostModel(userId: e['userId'],
    id: e['id'],
    title: e['title'],
    body: e['body']
    );
        }).toList();
      }
    }
    on SocketException{
      throw Exception('Socket Exception');
    }
    on TimeoutException{
      throw Exception('TimeOut Exception');
    }
    throw Exception('Something went wrong');

  }
}