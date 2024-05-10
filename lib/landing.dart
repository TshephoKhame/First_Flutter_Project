import 'package:first_flutter_project/mock/mock_stories.dart';
import 'package:first_flutter_project/model/story_list.dart';
import 'package:flutter/material.dart';
import 'product_view.dart';
import 'view_more.dart';

int currentIndex = 0;
String buttonName = "MyButton";

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final Stories showStories = StoryData.fetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: currentIndex == 0
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black12,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Trending",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_forward_rounded,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const ViewMore(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _renderStories(showStories, context),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: const Text(
                                  "Favourites",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 25),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_forward_rounded,
                                ),
                                onPressed: () => _navigateToViewMore(context),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _renderStories2(showStories, context),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}

void _navigateToViewMore(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => const ViewMore(),
    ),
  );
}

void _navigateToStoryView(BuildContext context, int iD) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => ProductView(iD: iD),
    ),
  );
}

List<Widget> _renderStories(Stories showStories, BuildContext context) {
  final result = <Widget>[];
  for (int i = 0; i < 4; i++) {
    result.add(
      _clickableCardBody(
          context,
          showStories.stories[i].image,
          showStories.stories[i].sname,
          showStories.stories[i].sbody,
          showStories.stories[i].iD),
    );
  }
  return result;
}

List<Widget> _renderStories2(Stories showStories, BuildContext context) {
  final result = <Widget>[];
  for (int i = 0; i < showStories.stories.length; i++) {
    if (showStories.stories[i].catagory == 'Adventure') {
      result.add(
        _clickableCardBody(
            context,
            showStories.stories[i].image,
            showStories.stories[i].sname,
            showStories.stories[i].sbody,
            showStories.stories[i].iD),
      );
    }
  }
  return result;
}

Widget _clickableCardBody(
    BuildContext context, String picture, String sname, String sbody, int iD) {
  return GestureDetector(
    onTap: () => _navigateToStoryView(context, iD),
    child: SizedBox(
      width: 280,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(
                  picture,
                  width: 270,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    sname,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  Text(
                    sbody,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: (() {
                          print("Comment");
                        }),
                        icon: const Icon(Icons.comment_rounded),
                        style: IconButton.styleFrom(
                          iconSize: 15,
                        ),
                      ),
                      IconButton(
                        onPressed: (() {
                          print("Share");
                        }),
                        icon: const Icon(Icons.share),
                        style: IconButton.styleFrom(
                          iconSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
