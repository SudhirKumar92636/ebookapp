import 'dart:convert';
import 'package:ebookapp/widgets/api_modle/usermodle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List<UsersModel> usermodle = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screens"),
        backgroundColor: Colors.indigo,
      ),
      drawer: const Drawer(),
      body: FutureBuilder(
        future: getUsers(),
        builder: (context ,snshot) {
          if(snshot.hasData){
            return ListView.builder(
            itemCount: usermodle.length,
            itemBuilder: (context, index) {
               return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                height: 120,
                color: Colors.blue,
                child:  Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("UserId:---${usermodle[index].userId}"),
                       Text("Id:---${usermodle[index].id}"),
                       Text("Title:---${usermodle[index].title}"),
                       Text("Body:---${usermodle[index].body}",maxLines: 1,)
                    ],
                  ),
                ),
               );
          },
          );
          }else{
            return const Text("Data is not found");
          }
          
        }
      ),
    );
    
  }
  Future<List<UsersModel>> getUsers()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map<String, dynamic> index in data){
        usermodle.add(UsersModel.fromJson(index));
      }
      return usermodle;
    }
    else{
        return usermodle;
    }
  }
}