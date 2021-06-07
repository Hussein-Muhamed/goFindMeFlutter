import 'package:flutter/cupertino.dart';
import 'package:go_find_me/core/auth/sign_in/sign_in.dart';
import 'package:go_find_me/modules/save_me/models/post.dart';
import 'package:go_find_me/modules/save_me/screens/search.dart';
import 'package:go_find_me/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_find_me/widgets/post.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: appDrawer(),
      appBar: AppBar(
        leadingWidth: 30.0,
        title: SizedBox(
          height: 34.0,
          child: TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: "Search",
              hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                letterSpacing: 1.5,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 10,
              ), // Added this
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black54,
              ),
            ),
            onChanged: (text) {
              print(text);
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 10.0,
            right: 30.0,
            child: Container(
              height: 30.0,
              width: 150.0,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            top: 50.0,
            left: 30.0,
            right: 30.0,
            height: MediaQuery.of(context).size.height * 0.75,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return PostWidget(post: myposts[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: myposts.length,
            ),
          ),
        ],
      ),
    );
  }
}
