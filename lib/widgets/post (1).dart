import 'package:biofuture/page/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Posts> {
  bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: CircleAvatar(),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Text("username",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ],
          ),
          ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 80,
              minWidth: 150,
              maxHeight: 600,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Container(
                margin: EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Text(
                  'We all know that bioinformatics and computational biology are here to stay and that their impact on scientific thought and direction will be increasing in the future. Since there is a lot of interdisciplinary research being undertaken by folks who participate in this forum, I am curious as to what big and interesting biological problems folks think will be best solved either directly by computational approaches or in an integrated computational and bench science environment. Of course, I know that the answer to this is "everything", but I am really curious about specific questions in your field of interest.',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Raleway',
                      color: Colors.black.withOpacity(1.0)),
                )),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                height: 100,
                width: MediaQuery.of(context).size.width * 0.33,
                child: Container(
                  width: 50,
                  child: Row(children: [
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      child: IconButton(
                          icon: new Icon(
                            Icons.favorite_rounded,
                          ),
                          color: _hasBeenPressed
                              ? Colors.teal
                              : Colors.deepOrange[400],
                          onPressed: () => {
                                setState(() {
                                  _hasBeenPressed = !_hasBeenPressed;
                                }),
                                print("press"),
                              }),
                    ),
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                height: 100,
                width: MediaQuery.of(context).size.width * 0.33,
                child: Container(
                  width: 50,
                  child: Row(children: [
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      child: IconButton(
                        icon: new Icon(
                          Icons.add_comment,
                        ),
                        color: Colors.deepOrange[400],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Comment()),
                          );
                        },
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
