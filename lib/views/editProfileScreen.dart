import 'dart:io';

import 'package:flutter/material.dart';

import '../variables.dart';

class EditProfileScreen extends StatelessWidget {
   EditProfileScreen({super.key});
   File? _image;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title:  Text("Edit Post",style: TextStyle(
            fontSize: 25,
            color: Variables.orangeColor,
            fontWeight: FontWeight.bold
        ),),

      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 10, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Select Profile Image"),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              // _settingModalBottomSheet(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Container(

                  width: MediaQuery.of(context).size.width/2.5,
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

                              _image =null;

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
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 10, right: 15),
            child: Row(
              children: [
                Text("User Name"),
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

                    decoration: const InputDecoration(
                      hintText: 'name',
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
                Text("Bio"),
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
                Text("Select Banner Image"),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
             // _settingModalBottomSheet(context);
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

                                _image =null;

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
        ],
      ),
    );
  }
}
