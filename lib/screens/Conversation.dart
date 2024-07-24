import 'package:chatapp/screens/widgets/Story.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  TextEditingController _searchInput = new TextEditingController();
  List conversationList = [
    {
      "name": "Novac",
      "imageUrl": "https://randomuser.me/api/portraits/men/81.jpg",
      "isOnline": true,
      "hasStory": true,
      "message": "Where are you?",
      "time": "5:00 pm"
    },
    {
      "name": "Derick",
      "imageUrl": "https://randomuser.me/api/portraits/men/65.jpg",
      "isOnline": false,
      "hasStory": false,
      "message": "It's good!!",
      "time": "7:00 am"
    },
    {
      "name": "Mevis",
      "imageUrl": "https://randomuser.me/api/portraits/men/61.jpg",
      "isOnline": true,
      "hasStory": false,
      "message": "I love You too!",
      "time": "6:50 am"
    },
    {
      "name": "Emannual",
      "imageUrl": "https://randomuser.me/api/portraits/men/79.jpg",
      "isOnline": true,
      "hasStory": true,
      "message": "Got to go!! Bye!!",
      "time": "yesterday"
    },
    {
      "name": "Gracy",
      "imageUrl": "https://randomuser.me/api/portraits/men/10.jpg",
      "isOnline": false,
      "hasStory": false,
      "message": "Sorry, I forgot!",
      "time": "2nd Feb"
    },
    {
      "name": "Robert",
      "imageUrl": "https://randomuser.me/api/portraits/men/79.jpg",
      "isOnline": false,
      "hasStory": true,
      "message": "No, I won't go!",
      "time": "28th Jan"
    },
    {
      "name": "Lucy",
      "imageUrl": "https://randomuser.me/api/portraits/men/79.jpg",
      "isOnline": false,
      "hasStory": false,
      "message": "Hahahahahaha",
      "time": "25th Jan"
    },
    {
      "name": "Emma",
      "imageUrl": "https://randomuser.me/api/portraits/men/16.jpg",
      "isOnline": false,
      "hasStory": false,
      "message": "Been a while!",
      "time": "15th Jan"
    }
  ];

  Column _conversations(BuildContext context) {
    return Column(
      children: List.generate(conversationList.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Row(
            children: [
              Container(
                width: 65,
                height: 65,
                child: Stack(
                  children: [
                    conversationList[index]["hasStory"] == true
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white,
                              border: Border.all(
                                width: 3,
                                color: Colors.green,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(35),
                                child: Image(
                                  image: NetworkImage(
                                      conversationList[index]["imageUrl"]),
                                  fit: BoxFit.cover,
                                  height: 57,
                                  width: 57,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(
                                image: NetworkImage(
                                    conversationList[index]["imageUrl"]),
                                fit: BoxFit.cover,
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ),
                    conversationList[index]["isOnline"] == true
                        ? Positioned(
                            right: 2,
                            bottom: 2,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 3)),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        child: Align(
                            child: Text(
                      conversationList[index]['name'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ))),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        child: Align(
                            child: Text(
                      "${conversationList[index]['message']} - ${conversationList[index]['time']}",
                    ))),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: ListView(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(
                          "https://randomuser.me/api/portraits/men/82.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text("Chats",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    )),
                Icon(
                  Icons.edit,
                  size: 25,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFe9eaec),
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                controller: _searchInput,
                cursorColor: Color(0xFF000000),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF000000).withOpacity(0.5),
                  ),
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Story(),
            SizedBox(
              height: 20,
            ),
            _conversations(context),
          ]),
        ),
      ),
    );
  }
}
