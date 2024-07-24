import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    List storyList = [
      {
        "name": "Novac",
        "imageUrl": "https://randomuser.me/api/portraits/men/81.jpg",
        "isOnline": true,
        "hasStory": true,
      },
      {
        "name": "Derick",
        "imageUrl": "https://randomuser.me/api/portraits/men/79.jpg",
        "isOnline": false,
        "hasStory": false,
      },
      {
        "name": "Mevis",
        "imageUrl": "https://randomuser.me/api/portraits/men/10.jpg",
        "isOnline": true,
        "hasStory": false,
      },
      {
        "name": "Emannual",
        "imageUrl": "https://randomuser.me/api/portraits/men/79.jpg",
        "isOnline": true,
        "hasStory": true,
      },
      {
        "name": "Gracy",
        "imageUrl": "https://randomuser.me/api/portraits/men/79.jpg",
        "isOnline": false,
        "hasStory": false,
      },
      {
        "name": "Robert",
        "imageUrl": "https://randomuser.me/api/portraits/men/16.jpg",
        "isOnline": false,
        "hasStory": true,
      }
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFe9eaec)),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 33,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 75,
                  child: Align(
                      child: Text(
                    'Your Story',
                    overflow: TextOverflow.ellipsis,
                  )),
                ),
              ],
            ),
          ),
          Row(
            children: List.generate(storyList.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      child: Stack(
                        children: [
                          storyList[index]["hasStory"] == true
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
                                            storyList[index]["imageUrl"]),
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
                                          storyList[index]["imageUrl"]),
                                      fit: BoxFit.cover,
                                      height: 60,
                                      width: 60,
                                    ),
                                  ),
                                ),
                          storyList[index]["isOnline"] == true
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
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 75,
                        child: Align(
                            child: Text(
                          storyList[index]['name'],
                          overflow: TextOverflow.ellipsis,
                        )))
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
