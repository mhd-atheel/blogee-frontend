import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical/components/post.dart';
import 'package:technical/provider/providers.dart';
import 'package:technical/variables.dart';
import 'package:technical/views/authScreen.dart';
import 'package:technical/views/editProfileScreen.dart';

import '../models/postModel.dart';

class MyProfile extends ConsumerStatefulWidget {
  const MyProfile({super.key});

  @override
  MyProfileState createState() => MyProfileState();
}

class MyProfileState extends ConsumerState<MyProfile> {
  bool tabIndex = false;
  String? username;
  String? email;
  String? id;
  void getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      email = prefs.getString('email');
      id = prefs.getString('id');
    });
  }

  @override
  void initState() {
    getPrefs();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postData = ref.watch(postDataByIdProvider);
    return RefreshIndicator(
      onRefresh: () async {
        getPrefs();

        ref.refresh(postDataByIdProvider);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Image(
                      image: const AssetImage('assets/images/post.jpeg'),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                    ),
                    Positioned(
                      bottom: -70,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(70),
                            child: Image.asset(
                              'assets/images/profile.png',
                              width: 30,
                              height: 30,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.clear().whenComplete(
                                () {
                                  Get.offAll(const AuthScreen());
                                  print("Logout");
                                }
                        );
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowRightFromBracket,
                        color: Colors.red,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to( EditProfileScreen());

                      },
                      icon: FaIcon(
                        FontAwesomeIcons.penToSquare,
                        color: Variables.orangeColor,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    username != null ? username! : '',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                    textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    email != null ? email! : '',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Variables.blueColor),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Lorem Ipsum is simply dsds dummy text of the printing and industry.",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Blogs",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "05",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Followers",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "1024",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Followings",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "1200",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Likes",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "2356",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Saved",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "15",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tabIndex = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Blogs",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Variables.blueColor),
                          textHeightBehavior: const TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tabIndex = true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Saved",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Variables.blueColor),
                          textHeightBehavior: const TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                    height: 1.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15), // Adjust the height as needed
                    width: MediaQuery.of(context)
                        .size
                        .width, // Adjust the width to decrease the divider's width
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: tabIndex == false
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15), // Adjust the height as needed
                        height: 2.0, // Adjust the height as needed
                        width: MediaQuery.of(context).size.width /
                            2.5, // Adjust the width to decrease the divider's width
                        color: Variables.blueColor,
                      ),
                    ],
                  )
                ],
              ),

              if (tabIndex == false)
                Column(
                  
                  children: [
                      postData.when(
                          data: (data) {
                            List<PostModel> postList =
                            data.map((e) => e).toList();
                            if(postList.isEmpty) {
                              return   Column(
                                children: [
                                  const SizedBox(height: 50,),
                                  const Center(
                                    child: Text(
                                      "No Blogs posted here",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        ref.refresh(postDataByIdProvider);
                                      },
                                      icon:  FaIcon(
                                        FontAwesomeIcons.arrowRotateRight,
                                        color: Variables.orangeColor,
                                        size: 40,
                                      )),
                                  const Center(
                                    child: Text(
                                      "Refresh the Page",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: postList.length,
                                itemBuilder: (context, index) {
                                  return Post(
                                      id: postList[index].id ?? '',
                                      userName: postList[index].username ?? '',
                                      postName: postList[index].postname ?? '',
                                      location: postList[index].location ?? '',
                                      likeCount: postList[index].likecount ?? 0,
                                      commentCount: postList[index].commentcount ?? 0,
                                      userId: postList[index].userid ?? '',
                                      createdAt: postList[index].createdAt ?? '',
                                      postImage: postList[index].postimage ?? '' ,
                                      userProfileImage: postList[index].userprofileimage ?? '');
                                });
                          },
                          error: (error, s) => Text(error.toString()),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          )),




                  ],
                ),
              if (tabIndex == true)
                const Column(
                  children: [
                    SizedBox(height: 50,),
                    Center(
                      child: Text(
                        "No Blogs Saved here",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
