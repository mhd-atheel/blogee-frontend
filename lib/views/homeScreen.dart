import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technical/components/post.dart';
import 'package:http/http.dart'as http;

import '../variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// 0E1041
class _HomeScreenState extends State<HomeScreen> {
  List tabs = [
    'All',
    'Today',
    'Trending',
    'Yesterday',
    'Following'
  ];
  int tabIndex = 0;
  List posts = [];

  Future<void>fetchPost()async {
    final url = Variables.basePostUri+Variables.getPost;
    final uri = Uri.parse(url);
    var data = {
      "type": "all"
    };
    final response = await http.post(
        uri,
        body: jsonEncode(data),
        headers: {"Content-Type":"application/json"}
    );
    final jsons = jsonDecode(response.body) as List<dynamic>;

    setState(() {
      posts =jsons;
    });
    print(posts);
  }
  @override
  void initState() {
    fetchPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text("Blogee",style: TextStyle(
          fontSize: 25,
          color: Variables.orangeColor,
          fontWeight: FontWeight.bold
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/profile.png'),
          )
        ],
      ),
      body:  SingleChildScrollView(
        clipBehavior:Clip.none,
        child: Column(
          children: [
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color:Variables.blueColor),
                borderRadius: BorderRadius.circular(10)
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListView.builder(
                    itemCount: tabs.length,
                    shrinkWrap: true,
                    physics:const  NeverScrollableScrollPhysics(),
                    scrollDirection:Axis.horizontal ,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            tabIndex =index;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(tabs.elementAt(index),style:
                               TextStyle(color: tabIndex==index ?Variables.blueColor:Colors.black,
                                 fontWeight: tabIndex==index ?FontWeight.bold:FontWeight.normal
                               ),

                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ListView.builder(
                 shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context,index){
                  return Post(

                    userName: posts[index]['username'],
                    postName: posts[index]['postname'],
                    location: posts[index]['location'],
                    likeCount: posts[index]['likecount'],
                    commentCount: posts[index]['commentcount'],
                    userId: posts[index]['userid'],
                    createdAt: posts[index]['createdAt'],
                    userProfileImage: posts[index]['userprofileimage'],
                    postImage: posts[index]['postimage'],
                  );
                }
            ),
            // Post(image: 'assets/images/lotus.jpg',),
            // Post(image: 'assets/images/profile.png',),
            // Post(image: 'assets/images/post2.png',),
            // Post(image: 'assets/images/post.jpeg'),
            // Post(),

          ],
        ),
      ),
    );
  }
}
