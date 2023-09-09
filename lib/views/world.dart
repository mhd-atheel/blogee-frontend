import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technical/models/userModel.dart';
import 'package:technical/provider/providers.dart';
import 'package:technical/variables.dart';

class World extends ConsumerWidget {
  const World({super.key});

  @override
  Widget build(BuildContext context , ref) {
   final userData = ref.watch(userDataProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 15.0, top: 10,right: 5),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(
                          // 0xfff2f2f2  - like a gray
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black54)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 0),
                          child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Find your friends',
                                labelStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              )),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,right: 15),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Variables.orangeColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        width: 50,
                        child: Center(child: FaIcon(FontAwesomeIcons.magnifyingGlass,color: Variables.blueColor,)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              userData.when(
                  data: (data){
                    List<UserModel> userList = data!.map((e) => e).toList();
                    return ListView.builder(
                        itemCount: userList.length,
                        shrinkWrap: true,
                        itemBuilder: (context ,index){
                          return ListTile(
                            title:  Text(userList[index].username ?? ''),
                            subtitle:  Text(userList[index].email),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(22),
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(22), // Image radius
                                child: CachedNetworkImage(
                                  imageUrl: userList[index].profileImage ?? '',
                                  imageBuilder: (context, imageProvider) => Container(
                                    height: 80,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error)
                                  => Image.asset('assets/images/profile.png'),
                                ),
                              ),
                            ),
                            trailing: const Icon(Icons.person_add_alt),
                          );
                        }
                    );
                  },
                  error: (error, s) => Text(error.toString()),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
