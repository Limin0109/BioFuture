// ignore_for_file: deprecated_member_use

//import 'dart:html';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:biofuture/service/postservice.dart';
//import 'package:biofuture/model/post.dart';
//import 'package:flutter_document_picker/flutter_document_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  UploadTask? task;
  File? file;

  final PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 100),
        height: 300,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(children: [
          Row(
            children: [
              Container(
                child: CircleAvatar(),
                margin: EdgeInsets.only(left: 30),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: 200,
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "   what's on your mind?",
                        border: InputBorder.none)),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width * 0.60,
                child: Container(
                  width: 100,
                  child: Row(children: [
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      child: IconButton(
                        icon: new Icon(Icons.document_scanner),
                        color: Colors.deepOrange[400],
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );

                          if (result == null) return;
                          final path = result.files.single.path!;

                          setState(() => file = File(path));
                        },
                      ),
                    ),
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width * 0.33,
                child: Container(
                  width: 100,
                  child: Row(children: [
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      child: IconButton(
                        icon: new Icon(Icons.image),
                        color: Colors.deepOrange[400],
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'png', 'jpeg'],
                          );

                          if (result == null) return;
                          final path = result.files.single.path!;

                          setState(() => file = File(path));
                        },
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTheme(
                minWidth: 350.0,
                height: 30,
                child: FlatButton(
                  onPressed: () async {
                    _postService.savePost('text');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => NewPost()));
                  },
                  child: Text(
                    "Post",
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(9.0),
                ),
              )
            ],
          ),
        ]));
  }
}
