import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical/models/postModel.dart';
import 'package:technical/services/postService.dart';

import '../variables.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  bool isLoading = false;
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadUrl;
  String? id;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  void getPrefs () async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString('id');
    });
  }
  Future imagePickerMethod(source) async{
    final pick =await imagePicker.pickImage(source: source);
    setState(() {
      if(pick != null){
        _image = File(pick.path);
      }
      // else{
      //   showSnackBars("No File Selected", Duration(milliseconds: 400));
      // }
    });
  }
  Future<void>createPost (String downloadUrl) async {
    final postModel = PostModel(
        postname: descriptionController.text,
        location: locationController.text,
        userid: id,
        postimage: downloadUrl
    );
    await PostService.createPost(postModel).whenComplete((){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Create Succuess"),)
      );
    });
  }

  Future<void> uploadImage () async{
    final  posttime = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance.ref().child('posts').child(id!).child(posttime);
    await ref.putFile(_image!);
    downloadUrl = await ref.getDownloadURL();
    print(downloadUrl);
  }
 @override
  void initState() {
   getPrefs();
    super.initState();
  }

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 10, right: 15,bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Select Image From"),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Navigator.pop(context);
                          imagePickerMethod(ImageSource.camera);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(FontAwesomeIcons.camera,size: 50,),
                        Text("Camera",style: TextStyle(
                        fontSize: 15,
                        color: Variables.orangeColor,
                        fontWeight: FontWeight.bold
                  ),)
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                          imagePickerMethod(ImageSource.gallery);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(FontAwesomeIcons.image,size: 50,),
                        Text("Gallery",style: TextStyle(
                        fontSize: 15,
                        color: Variables.orangeColor,
                        fontWeight: FontWeight.bold
                  ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title:  Text("Create Post",style: TextStyle(
            fontSize: 25,
            color: Variables.orangeColor,
            fontWeight: FontWeight.bold
        ),),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0, top: 10, right: 15),
                child: Row(
                  children: [
                    Text("Description"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5, right: 15),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // 0xfff2f2f2  - like a gray
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black54)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0),
                    child: TextFormField(
                      controller: descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'write..',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      minLines: 1,
                      maxLines: 5,

                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, top: 10, right: 15),
                child: Row(
                  children: [
                    Text("Location"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5, right: 15),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // 0xfff2f2f2  - like a gray
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black54)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0),
                    child: TextFormField(
                      controller: locationController,
                        decoration: const InputDecoration(
                          hintText: 'select location',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        )),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, top: 10, right: 15),
                child: Row(
                  children: [
                    Text("Select Image"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  _settingModalBottomSheet(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: Container(
                    
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // 0xfff2f2f2  - like a gray
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black54)),
                    child: _image == null?
                    const SizedBox(
                      height: 150,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image,size: 50,),
                            Text("Select Image")
                          ],
                        ),
                      ),
                    ):Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.file(_image!),
                        ),
                        const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image,size: 50,color: Colors.white,),
                              Text("Select Image",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        ),
                         Positioned(
                            top: 10,
                            right: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _image =null;
                                });
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                  child: Icon(Icons.close)),
                            ))
                      ],
                    )
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading =true;
                  });
                  uploadImage().then((value) {
                     createPost(downloadUrl!).whenComplete(() {
                      setState(() {
                        isLoading = false;
                      });
                    });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Variables.orangeColor,
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: isLoading==false ?const Text('Create',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ):const CircularProgressIndicator()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
