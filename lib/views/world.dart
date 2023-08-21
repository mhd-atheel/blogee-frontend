import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technical/variables.dart';

class World extends StatelessWidget {
  const World({super.key});

  @override
  Widget build(BuildContext context) {
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
              ListView.builder(
                  itemCount: 15,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder:(context,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: ListTile(
                        title: const Text('Mohamed Atheel'),
                        subtitle: const Text("Daily quotes"),
                        leading: Image.asset('assets/images/profile.png'),
                        trailing: const Icon(Icons.person_add_alt),
                      ),
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
