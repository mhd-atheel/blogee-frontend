import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technical/components/post.dart';
import 'package:http/http.dart'as http;
import 'package:technical/models/postModel.dart';

import 'package:technical/services/postService.dart';

import '../provider/providers.dart';
import '../variables.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}): super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}
// 0E1041
class HomeScreenState extends ConsumerState<HomeScreen>{
  List tabs = [
    'All',
    'Today',
    'Trending',
    'Yesterday',
    'Following'
  ];
  int tabIndex = 0;
  List posts = [];

  Future<void>fetchPost() async {
    const url = Variables.basePostUri+Variables.getPost;
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
  // @override
  // void initState() {
  //   PostService.fetchPost();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context ,) {
    final postData = ref.watch(postDataProvider);
    return  RefreshIndicator(
      onRefresh: ()async{
         ref.refresh(postDataProvider);
      },
      child: Scaffold(
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
              postData.when(
                  data:(data){
                    List<PostModel> postList = data.map((e) => e).toList();
                    return ListView.builder(
                        shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        itemCount: postList.length,
                        itemBuilder:(context,index){
                          return Post(
                              id: postList[index].id ?? '',
                              userName: postList[index].username ?? '',
                              postName: postList[index].postname ?? '',
                              location: postList[index].location ?? '',
                              likeCount:postList[index].likecount ?? 0,
                              commentCount: postList[index].commentcount ?? 0,
                              userId: postList[index].userid ?? '',
                              createdAt: postList[index].createdAt ?? '',
                              postImage: postList[index].postimage,
                              userProfileImage: postList[index].userprofileimage ?? ''
                          ) ;
                        } ) ;
                  },
                  error: (error, s) => Text(error.toString()),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
