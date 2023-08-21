import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../variables.dart';

class Post extends StatefulWidget {
  final String userName;
  final String postName;
  final String location;
  final int likeCount;
  final int commentCount;
  final String userId;
  final String createdAt;
  final  postImage;
  final  userProfileImage;
   Post({
     super.key ,
     required this.userName,
     required this.postName,
     required this.location,
     required this.likeCount,
     required this.commentCount,
     required this.userId,
     required this.createdAt,
     required this.postImage,
     required this.userProfileImage,
   });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
   bool isCommentOpen = false;
   bool isLiked = false;
   DateTime today = DateTime.now();

   @override
  void initState() {
     print(today);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color:const Color(0xff0E1041)),
          borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
      child:  Column(
        children: [
          //Image.network('https://firebasestorage.googleapis.com/v0/b/grocery-app-9b16d.appspot.com/o/UserProfiles%2F9SjzLdvKjKgQn22aryWvwqC5rfB2%2F1673286778692?alt=media&token=67ee3f82-d45d-4f2b-9284-313580cf3eb2'),
          ListTile(
            title:  Text(widget.userName),
            subtitle: Text(widget.location),
            leading: Image.asset('assets/images/profile.png'),
            trailing: const Icon(Icons.more_vert_outlined),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Expanded(child: Text(widget.postName)),
              ],
            ),
          ),
          if(widget.postImage != null)
            Column(
              children: [
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Image.network(widget.postImage!,width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
                ),
              ],
            ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isLiked =!isLiked;
                        });
                      },
                        child: Row(
                          children: [
                            FaIcon(
                              isLiked ==true?FontAwesomeIcons.solidHeart:FontAwesomeIcons.heart,
                              color:Variables.blueColor,size: 18,),
                             Text(' ${widget.likeCount.toString()}'),
                          ],
                        )),

                    const SizedBox(width: 15,),
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            isCommentOpen =true;
                          });
                        },
                        child:  Text("${widget.commentCount.toString()} comments")),
                  ],
                ),
                Row(
                  children: [
                    Text(today.toString().substring(0,10)
                        == widget.createdAt.substring(0,10) ?'Today':
                    widget.createdAt.substring(0,10)
                    ),
                  ],
                )
              ],
            ),
          ),

           if(isCommentOpen == true)
             Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(right: 15.0,top: 5),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       GestureDetector(
                           onTap: (){
                             setState(() {
                               isCommentOpen =false;
                             });
                           }, child: const Icon(Icons.close))
                     ],
                   ),
                 ),
                 ListView.builder(
                     shrinkWrap: true,
                     itemCount: 2,
                     itemBuilder: (context,index){
                       return Padding(
                         padding: const EdgeInsets.only(left: 20.0),
                         child: ListTile(
                           title: const Text("Unknown",style: TextStyle(fontSize: 15),),
                           subtitle:const Text("Good post Lorem Ipsum has been the"
                               " industry s standard dummy text ever since the 1500s",style: TextStyle(fontSize: 13),
                           ),
                           leading: Image.asset('assets/images/profile.png',width: 40,),
                         ),
                       );
                     }
                 ),
               ],
             ),
          const SizedBox(height: 5,),

        ],
      ),
    );
  }
}